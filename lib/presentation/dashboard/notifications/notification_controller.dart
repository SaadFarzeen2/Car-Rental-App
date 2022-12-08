import 'dart:convert';
import 'dart:developer';

import 'package:traval/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:traval/repo/dashboard/dashboard_repo.dart';

class NotificationController extends GetxController {
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  Future getNotifications() async {
    RxList<NotificationModel> nList = <NotificationModel>[].obs;
    isLoading = true.obs;
    http.Response? response = await DashboardRepo.getNotificationList();
    isLoading.value = false;
    if (response!.statusCode == 200 || response.statusCode == 201) {
      var decoded = json.decode(response.body);
      log(decoded.toString());
      if (decoded["data"] != null) {
        for (var i = 0; i < decoded["data"].length; i++) {
          NotificationModel notification = NotificationModel(
            bookingId: decoded['data'][i]['booking_id'],
            text: decoded['data'][i]['message'],
            time: decoded['data'][i]['created_at'],
            title: decoded['data'][i]['title'],
          );
          nList.add(notification);
        }
        notifications += nList;
      }
    } else {
      isLoading.value = false;
    }
  }
}

class NotificationModel {
  final int bookingId;
  final String title;
  final String text;
  final String time;
  NotificationModel({
    required this.bookingId,
    required this.title,
    required this.text,
    required this.time,
  });
}
