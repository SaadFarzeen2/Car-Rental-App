import 'package:get/get.dart';

class AppConfig {
  // App Name
  static const String appName = 'TRAVAL';
  // static String apiBaseUrl = "http://159.65.144.60/traval/public/api/";
  static String apiBaseUrl = "https://traval.pics/api/";
  static Map noInternetError = {"message": "nointernetconnection".tr};
  static String apiError = 'somethingwentwrong'.tr;
  static String api500Error = 'servernotfound'.tr;
  static String noInternetText = "nointernetconnection".tr;
}
