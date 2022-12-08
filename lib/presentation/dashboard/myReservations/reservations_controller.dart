import 'dart:convert';

import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/models/booking_model.dart';
import 'package:traval/models/vehicle_model.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/repo/dashboard/dashboard_repo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/app_export.dart';
import 'package:http/http.dart' as http;

class MyReservationsScreenController extends GetxController {
  RxList<BookingModel> bookings = <BookingModel>[].obs;
  RxInt currentPage = 1.obs;
  RxString search = "".obs;

  RxBool isPaginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxBool isLoading = false.obs;

  ScrollController scrollController = ScrollController();
  // with GetSingleTickerProviderStateMixin {
  // RxBool isloading = true.obs;
  // RxInt currentIndex = 0.obs;
  // TabController? tabController;
  // List tabList = ['active'.tr, 'all'.tr];
  // @override
  // void onInit() {
  //   tabController = TabController(initialIndex: 0, vsync: this, length: 2);

  //   tabController!.addListener(_handleTabSelection);
  //   isloading.value = false;
  //   super.onInit();
  // }

  // _handleTabSelection() {
  //   if (tabController!.indexIsChanging) {
  //     currentIndex.value = tabController!.index;
  //   }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   tabController!.dispose();
  // }

  Future getBookings(bool isInitial) async {
    RxList<BookingModel> bList = <BookingModel>[].obs;
    if (isInitial) {
      bookings.value = [];
      currentPage.value = 1;
      nextPageStop.value = true;
      isLoading = true.obs;
    }
    if (nextPageStop.isTrue) {
      http.Response? response = await DashboardRepo.bookingList(
        page: currentPage.value,
      );
      isLoading.value = false;
      isPaginationLoading.value = false;
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var decoded = json.decode(response.body);
        if (decoded["data"]["data"] != null) {
          for (var i = 0; i < decoded["data"]["data"].length; i++) {
            BookingModel booking =
                BookingModel.fromMap(decoded["data"]["data"][i]);
            bList.add(booking);
          }
          bookings += bList;
          currentPage.value++;
          if (bookings.length == decoded["data"]["total"]) {
            nextPageStop.value = false;
          }
        }
      }
    } else {
      isPaginationLoading.value = false;
      isLoading.value = false;
    }
  }

  void manageScrollController() async {
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          if (nextPageStop.isTrue && isPaginationLoading.isFalse) {
            isPaginationLoading.value = true;
            getBookings(false);
          }
        }
      },
    );
  }

  @override
  void onInit() {
    getBookings(true);
    manageScrollController();
    super.onInit();
  }

  void openDialog(BranchModel? branch, bId) {
    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "${'toconfirmthisorder'.tr}\n${'npleasecontactthisbranch'.tr}"),
            hSizedBox20,
            Row(
              children: [
                Expanded(
                  child: Text(
                    branch!.title!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => launchURL(
                    lat: branch.lat,
                    long: branch.long,
                  ),
                  icon: Image.asset(
                    ImageConstant.gMap,
                    height: 22,
                  ),
                  color: AppColors.appColor,
                ),
              ],
            ),
            const Divider(),
            hSizedBox10,
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: AppColors.appColor,
                ),
                wSizedBox10,
                Expanded(
                  child: Text(
                    branch.contactNo!,
                  ),
                ),
              ],
            ),
            hSizedBox20,
            Text(
              "openClose".tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            hSizedBox8,
            timeWidget(
              title: "sunday".tr,
              timeFrom: branch.sundayStartTime!,
              timeTo: branch.sundayEndTime!,
            ),
            hSizedBox6,
            timeWidget(
              title: "monday".tr,
              timeFrom: branch.mondayStartTime!,
              timeTo: branch.mondayEndTime!,
            ),
            hSizedBox6,
            timeWidget(
              title: "tuesday".tr,
              timeFrom: branch.tuesdayStartTime!,
              timeTo: branch.tuesdayEndTime!,
            ),
            hSizedBox6,
            timeWidget(
              title: "wednesday".tr,
              timeFrom: branch.wednesdayStartTime!,
              timeTo: branch.wednesdayEndTime!,
            ),
            hSizedBox6,
            timeWidget(
              title: "thursday".tr,
              timeFrom: branch.thursdayStartTime!,
              timeTo: branch.thursdayEndTime!,
            ),
            hSizedBox6,
            timeWidget(
              title: "friday".tr,
              timeFrom: branch.fridayStartTime!,
              timeTo: branch.fridayEndTime!,
            ),
            hSizedBox6,
            timeWidget(
              title: "saturday".tr,
              timeFrom: branch.saturdayStartTime!,
              timeTo: branch.saturdayEndTime!,
            ),
            hSizedBox20,
            AppButton(
              color: Colors.white,
              border: true,
              textColor: AppColors.appColor,
              borderColor: AppColors.appColor,
              text: "cancelbooking".tr,
              onPressed: () => cancelBooking(bId),
            ),
          ],
        ),
      ),
    );
  }

  String timeString({required String? time}) {
    if (time != null) {
      var dateTime = DateFormat("hh:mm:ss").parse(time, true);
      var t = DateFormat().add_jm().format(dateTime);
      return t;
    } else {
      return "--:--";
    }
  }

  Widget timeWidget({
    required String? title,
    required String? timeFrom,
    required String? timeTo,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${title ?? ''} - '),
          TextSpan(
            text: "${timeString(
              time: timeFrom,
            )} to ${timeString(
              time: timeTo,
            )}",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  launchURL({lat, long}) async {
    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";

    if (await canLaunchUrl(Uri.parse(googleMapslocationUrl))) {
      await launchUrl(Uri.parse(googleMapslocationUrl));
    } else {
      throw 'Could not launch $googleMapslocationUrl';
    }
  }

  void cancelBooking(id) async {
    Get.back();
    LoadingOverlay.of(Get.context!).show();
    http.Response? res = await DashboardRepo.cancelBooking(
      bookingId: id,
    );
    LoadingOverlay.of(Get.context!).hide();
    if (res != null) {
      var decoded = json.decode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        toast(decoded['message']);
        Get.back();
        currentPage.value = 1;
        bookings.value = [];
        getBookings(true);
      } else if ([409, 403, 401, 400, 422].contains(res.statusCode)) {
        toast(decoded['message']);
      } else if (res.statusCode == 500) {
        toast(AppConfig.api500Error);
      }
    } else {
      toast(AppConfig.apiError);
    }
  }
}
