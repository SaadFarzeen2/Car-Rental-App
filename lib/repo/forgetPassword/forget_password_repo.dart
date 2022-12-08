import 'dart:convert';

import 'package:traval/core/utils/helper.dart';
import 'package:traval/core/utils/local_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:http/http.dart' as http;

import '../../../core/network/network_info.dart';
import '../../../core/utils/app_config.dart';

class ForgotPasswordRepo {
  static Future forgotpasswordAPI({
    required String email,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}forgot-password';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
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

  static Future createPassword({
    required String email,
    required String password,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}reset-password';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
            "password": password,
            "password_confirmation": password,
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

  static Future changePassword({
    required String password,
    required String newPassword,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}change-password';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            'x-access-token': LocalStorage.token,
          },
          body: {
            "old_password": password,
            "new_password": newPassword,
            "confirm_password": newPassword,
          },
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
