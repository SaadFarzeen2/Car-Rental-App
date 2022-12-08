import 'dart:convert';

import 'package:traval/core/app_export.dart';
import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:http/http.dart' as http;
import 'package:traval/core/utils/local_storage.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/repo/login/login_repo.dart';

class VerificationController extends GetxController {
  RxString otp = "".obs;
  RxString email = "".obs;

  onVerify() async {
    if (otp.value.isNotEmpty) {
      LoadingOverlay.of(Get.context!).show();
      http.Response? res = await LoginRepo.verifyEmail(
        email: email.value,
        otp: otp.value,
      );
      LoadingOverlay.of(Get.context!).hide();
      if (res != null) {
        var decoded = json.decode(res.body);
        if (res.statusCode == 200 || res.statusCode == 201) {
          LocalStorage.storeDataInfo(decoded["data"]);
          Get.offAndToNamed(AppRoutes.dashboardScreen);
        } else if ([409, 403, 401, 400, 422].contains(res.statusCode)) {
          toast(decoded['message']);
        } else if (res.statusCode == 500) {
          toast(decoded['message']);
        }
      } else {
        toast(AppConfig.apiError);
      }
    } else {
      toast("entervalidotp".tr);
    }
  }

  @override
  void onInit() {
    email.value = Get.arguments;
    super.onInit();
  }
}
