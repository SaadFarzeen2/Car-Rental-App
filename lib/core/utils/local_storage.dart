import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import '../../localization/localization_service.dart';
import 'app_prefs.dart';

class LocalStorage {
  static String userId = "";
  static String token = "";
  static String userEmail = "";
  static String firstName = "";
  static String lastName = "";
  static String userMobile = "";
  static String? userProfile = "";
  static String deviceId = "";
  static String deviceToken = "";
  static String deviceType = "";
  static bool isLogin = false;
  static LocalizationService? local;

  static getAuthToken() async {
    final prefs = GetStorage();
    print(GetStorage().read(Prefs.token));
    return prefs.read(Prefs.token);
  }

  static void storeDataInfo(json) async {
    final prefs = GetStorage();
    //* Store Token
    prefs.write(Prefs.token, json['auth_token'].toString());
    //* Store UserId
    prefs.write(Prefs.userId, json["id"].toString());
    // //* Store firstName
    prefs.write(Prefs.firstName, json['first_name']);
    // //* Store lastName
    prefs.write(Prefs.lastName, json['last_name']);
    // //* Store email
    prefs.write(Prefs.email, json['email'] ?? "");
    // //* Store mobile
    prefs.write(Prefs.mobile, json['phone_number'].toString());
    //* Store User Profile Image
    if (json['image_path'] != null) {
      prefs.write(Prefs.profileImage, json['image_path']);
    }
    //* set data
    userId = prefs.read(Prefs.userId);
    token = prefs.read(Prefs.token);
    userEmail = prefs.read(Prefs.email);
    firstName = prefs.read(Prefs.firstName);
    lastName = prefs.read(Prefs.lastName);
    userMobile = prefs.read(Prefs.mobile);
    userProfile = prefs.read(Prefs.profileImage) ?? "" as dynamic;

    loadLocalData();
  }

  static void storeProfileInfo(json) async {
    final prefs = GetStorage();
    // //* Store firstName
    prefs.write(Prefs.firstName, json['first_name']);
    // //* Store lastName
    prefs.write(Prefs.lastName, json['last_name']);
    // //* Store email
    prefs.write(Prefs.email, json['email'] ?? "");
    // //* Store mobile
    prefs.write(Prefs.mobile, json['phone_number'].toString());
    //* Store User Profile Image
    if (json['image_path'] != null) {
      prefs.write(Prefs.profileImage, json['image_path']);
    }
    //* set data
    userEmail = prefs.read(Prefs.email);
    firstName = prefs.read(Prefs.firstName);
    lastName = prefs.read(Prefs.lastName);
    userMobile = prefs.read(Prefs.mobile);
    userProfile = prefs.read(Prefs.profileImage) ?? "" as dynamic;

    loadLocalData();
  }

  static void storeDeviceInfo(
    String deviceID,
    String deviceTOKEN,
    String deviceTYPE,
  ) async {
    final prefs = GetStorage();
    try {
      const url = 'https://api.ipify.org';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        prefs.write(Prefs.deviceIP, response.body);
      } else {
        // print(response.body);
      }
    } catch (exception) {
      // print(exception);
    }
    //* Store device id
    prefs.write(Prefs.deviceID, deviceID);
    //* Store device token
    prefs.write(Prefs.deviceFCMtoken, deviceTOKEN);
    //* Store device type
    prefs.write(Prefs.deviceType, deviceTYPE);

    //* set data
    deviceId = prefs.read(Prefs.deviceID);
    deviceToken = prefs.read(Prefs.deviceFCMtoken);
    deviceType = prefs.read(Prefs.deviceType);
    loadLocalData();
  }

  static void selectLanguage() {
    final prefs = GetStorage();
    prefs.write(Prefs.selectLanguage, LocalizationService.locale);
    local = prefs.read(Prefs.selectLanguage);
  }

  static void loadLocalData() {
    final prefs = GetStorage();
    userId = prefs.read(Prefs.userId) ?? "";
    token = prefs.read(Prefs.token) ?? "";
    userEmail = prefs.read(Prefs.email) ?? "";
    firstName = prefs.read(Prefs.firstName) ?? "";
    lastName = prefs.read(Prefs.lastName) ?? "";
    userProfile = prefs.read(Prefs.profileImage) ?? "";
    userMobile = prefs.read(Prefs.mobile) ?? "";
    local = prefs.read(Prefs.selectLanguage);
  }

  static void clearLocalData() {
    GetStorage().erase();
    loadLocalData();
  }
}
