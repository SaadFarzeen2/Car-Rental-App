import 'dart:developer';
import 'dart:io';

import 'package:traval/core/network/network_info.dart';
import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:http/http.dart' as http;

class AppConfigRepo {
  static Future appconfigAPI() async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url =
            '${AppConfig.apiBaseUrl}app-config/${Platform.isIOS ? 'ios' : 'android'}';
        http.Response response = await http.get(
          Uri.parse(url),
          // headers: {
          //   "Content-Type": "application/json",
          // },
        );
        return response;
      } else {
        toast(AppConfig.noInternetText);
      }
    } catch (e) {
      log(e.toString());
      toast(AppConfig.apiError);
      return null;
    }
  }
}
