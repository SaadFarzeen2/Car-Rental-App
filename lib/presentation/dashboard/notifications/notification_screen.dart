import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/comman_widget/app_bar.dart';
import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:traval/presentation/dashboard/myReservations/reservations_controller.dart';
import 'package:traval/presentation/dashboard/myReservations/reservations_screen.dart';
import 'package:traval/presentation/dashboard/notifications/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final NotificationController _con = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: 'notifications'.tr,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => _con.isLoading.value
            ? const AppLoader()
            : _con.notifications.isEmpty
                ? Center(
                    child: Text(
                      "nothinghereyet".tr,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: _con.notifications.length,
                    padding: const EdgeInsets.all(20),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.delete<MyReservationsScreenController>();
                          Get.to(
                            () => MyReservationsScreen(),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _con.notifications[index].title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    hSizedBox10,
                                    Text(
                                      "${_con.notifications[index].text} on\n${Jiffy(_con.notifications[index].time).fromNow()}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "${'bookingid'.tr} : ${_con.notifications[index].bookingId}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
