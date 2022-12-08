import 'package:traval/core/utils/helper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../core/network/network_info.dart';
import '../../core/utils/app_config.dart';
import 'package:http/http.dart' as http;
import '../../core/utils/local_storage.dart';

class DashboardRepo {
  static Future vehicalListAPI({
    required int page,
    required String search,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url =
            '${AppConfig.apiBaseUrl}vehicles?page=$page&search=$search';
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

  static Future bookingList({
    required int page,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}bookings?page=$page';
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

  static Future vehicleDetailAPI({required int id}) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}vehicles/$id';
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

  static Future getBranchList() async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}branches';
        http.Response response = await http.get(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            // 'x-access-token': LocalStorage.token,
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


  static Future getNotificationList() async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}notifications';
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

  static Future createBooking({
    required String vehicleId,
    required String rLocation,
    required String pLocation,
    required String receiveDate,
    required String pickupDate,
    required String withDriver,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}bookings';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            'x-access-token': LocalStorage.token,
          },
          body: {
            "vehicle_id": vehicleId,
            "receive_location": rLocation,
            "pickup_location": pLocation,
            "receive_date": receiveDate,
            "pickup_date": pickupDate,
            "with_driver": withDriver,
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

  static Future cancelBooking({
    required bookingId,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}bookings/$bookingId';
        http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            'x-access-token': LocalStorage.token,
          },
          body: {
            "status": "cancelled",
            "_method": "PUT",
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

  static Future getSingleBooking({
    required bookingId,
  }) async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url = '${AppConfig.apiBaseUrl}bookings/$bookingId';
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

  static Future getAboutUs() async {
    try {
      bool connection = await NetworkInfo(
        connectivity: Connectivity(),
      ).isConnected();
      if (connection) {
        String url =
            '${AppConfig.apiBaseUrl}get-about-us';
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
}
