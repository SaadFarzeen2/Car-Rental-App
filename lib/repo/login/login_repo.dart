import 'dart:convert';

import 'package:traval/core/utils/helper.dart';
import 'package:traval/core/utils/local_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:http/http.dart' as http;

import '../../../core/network/network_info.dart';
import '../../../core/utils/app_config.dart';

class LoginRepo {
  static Future loginAPI({
    required String email,
    required String password,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}login';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
            "password": password,
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

  static Future verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}verify-email';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
            "otp": otp,
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

  static Future socialLoginAPI({
    required String fname,
    required String lname,
    String? email,
    required String socialid,
    required String socialtype,
    String? profileImage,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}social-login';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "first_name": fname,
            "last_name": lname,
            "email": email,
            "social_id": socialid,
            "social_type": socialtype,
            "user_type": "user",
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
