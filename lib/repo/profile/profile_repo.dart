import 'package:traval/core/utils/helper.dart';
import 'package:traval/core/utils/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:traval/core/network/network_info.dart';
import 'package:traval/core/utils/app_config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ProfileRepo {
  static Future getProfileDetails() async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}user-profile';
        http.Response response = await http.get(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'x-access-token': LocalStorage.token,
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

  static Future editProfileRepo({
    required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String address,
    required String userType,
    required String idNumber,
    required String dob,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}edit-profile';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            'x-access-token': LocalStorage.token,
          },
          body: {
            "email": email,
            "first_name": firstName,
            "last_name": lastName,
            "phone_number": mobile,
            "address": address,
            "user_type" : userType,
            "identification_number" : idNumber,
            "dob" : dob,
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

  static Future submitQuery({
    required String email,
    required String name,
    required String message,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}contact-us';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            'x-access-token': LocalStorage.token,
          },
          body: {
            "email": email,
            "name": name,
            "message": message,
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
