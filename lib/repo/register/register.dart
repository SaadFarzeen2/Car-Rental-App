import 'dart:convert';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/core/utils/local_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import '../../../core/network/network_info.dart';
import '../../../core/utils/app_config.dart';

class RegisterRepo {
  static Future registerAPI({
    required String email,
    required String password,
    required String fname,
    required String lname,
    required String phonenumber,
    // required String branchId,
    required String userType,
    required String idNumber,
    required String dob,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}register';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "first_name": fname,
            "last_name": lname,
            "phone_number": phonenumber,
            "email": email,
            "password": password,
            "confirm_password": password,
            "role": "user",
            "user_type": userType,
            "identification_number": idNumber,
            "dob": dob,
            "device_id": LocalStorage.deviceId,
            "device_token": LocalStorage.deviceToken,
            "device_type": LocalStorage.deviceType,
          }),
        );
        return response;
      } else {
        toast(AppConfig.noInternetText);
      }
    } catch (e) {
      toast(AppConfig.apiError);
      return null;
    }
  }
}
