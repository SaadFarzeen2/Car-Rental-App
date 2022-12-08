import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:traval/core/utils/app_prefs.dart';
import 'package:traval/core/utils/local_storage.dart';
import 'package:traval/repo/appConfig/app_config.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '/core/app_export.dart';

import 'package:http/http.dart' as http;

class SplashController extends GetxController {
  RxInt updatecheckscreen = 0.obs;
  RxString updateNewInfo = "".obs;

  @override
  void onInit() {
    appConfig();
    super.onInit();
  }

  getMessage() async {
    final prefs = GetStorage();
    if (await prefs.read(Prefs.token) != null &&
        await prefs.read(Prefs.token) != "") {
      Get.offAllNamed(AppRoutes.dashboardScreen);
    } else {
      Get.offNamed(AppRoutes.loginScreen);
    }
  }

  void storeDeviceInfo(fcmToken) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      // unique ID on iOS
      LocalStorage.storeDeviceInfo(
        iosDeviceInfo.identifierForVendor.toString(),
        fcmToken,
        "ios",
      );
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      // unique ID on Android
      LocalStorage.storeDeviceInfo(
        androidDeviceInfo.id.toString(),
        fcmToken,
        "android",
      );
    }
  }

  appConfig() async {
    // LoadingOverlay.of(Get.context!).show();
    http.Response? response = await AppConfigRepo.appconfigAPI();
    // LoadingOverlay.of(Get.context!).hide();

    log(response.toString());

    var res = json.decode(response!.body);
    if (res != null) {
      if (res["data"] != null) {
        var decoded = res['data'].first;
        if (Platform.isIOS && decoded['device_type'] == "ios") {
          FirebaseMessaging.instance.getToken().then((token) {
            storeDeviceInfo(token);
            appUpdateFun(decoded);
          });
        }
        if (Platform.isAndroid && decoded['device_type'] == "android") {
          FirebaseMessaging.instance.getToken().then(
            (token) {
              log("messageeeeee");
              storeDeviceInfo(token);
              appUpdateFun(decoded);
            },
          );
        }
      }
    }
  }

  appUpdateFun(dynamic res) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    int id = version.compareTo(res['version']);
    if (res["force_update"] == "true") {
      if (id == -1) {
        updatecheckscreen.value = 1;
        updateNewInfo.value = res['description'];
      } else {
        getMessage();
      }
    } else {
      if (id == -1) {
        updatecheckscreen.value = 2;
        updateNewInfo.value = res['info_update'];
      } else {
        getMessage();
      }
    }
  }
}
