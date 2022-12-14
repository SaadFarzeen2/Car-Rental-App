import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traval/core/app_export.dart';
import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/presentation/dashboard/carDetails/car_details_con.dart';
import 'package:traval/presentation/dashboard/dashboard.dart';
import 'package:traval/presentation/dashboard/initial_car_details/initial_car_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:traval/presentation/dashboard/myReservations/reservations_controller.dart';
import 'package:traval/repo/dashboard/dashboard_repo.dart';

import '../../comman_widget/app_button.dart';

class InitialCarDetailScreen extends StatefulWidget {
  String? delivery_location;
  String? received_location;
  String? delivery_datetime;
  String? receive_datetime;
  String? withdriver;
  String? veh_id;
  String? del_loc_error;
  String? rec_loc_error;

  InitialCarDetailScreen({
    Key? key,
    required this.delivery_location,
    required this.received_location,
    required this.delivery_datetime,
    required this.receive_datetime,
    required this.withdriver,
    required this.veh_id,
    required this.del_loc_error,
    required this.rec_loc_error,
  }) : super(key: key);

  @override
  State<InitialCarDetailScreen> createState() => _InitialCarDetailScreenState();
}

class _InitialCarDetailScreenState extends State<InitialCarDetailScreen> {
  final InitialCarDetailController _controller =
      Get.put(InitialCarDetailController());
  int days = 0;
  int total_amount = 0;
  final CarDetailsController con = Get.put(CarDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    // con.vehicle!.rateperday;

    DateTime rec_date = DateTime.parse(widget.receive_datetime!);
    DateTime del_date = DateTime.parse(widget.delivery_datetime!);
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }
    // log("message");

    // log(widget.receive_datetime!);
    // log(widget.delivery_datetime!);
    // log(rec_date.toString());
    // log(del_date.toString());
    var difference = daysBetween(del_date, rec_date);
    if (difference < 0) {
      difference = 0;
    }
    days = difference + 1;
    log(days.toString());
    log(con.vehicle!.rateperday.toString());
    int? amount = con.vehicle!.rateperday;
    total_amount = (amount! * days);
    log(total_amount.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                '${con.vehicle!.companyName}',
                style: const TextStyle(
                  color: Color(0xff0D1724),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${con.vehicle!.title}',
                style: const TextStyle(
                  color: Color(0xff0D1724),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox20,
              timeplace(
                details: "receivinglocation".tr,
                descpt: widget.received_location.toString(),
              ),
              SizedBox(
                height: 10,
              ),
              timeplace(
                details: "deliverylocation".tr,
                descpt: widget.delivery_location.toString(),
              ),
              SizedBox(
                height: 10,
              ),
              // timeplace(
              //   details: "receiptanddeliverydatetime".tr,
              //   descpt: "09:24 AM",
              // ),
              SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: con.carouselController,
                      options: CarouselOptions(
                        height: Get.height * .18,
                        viewportFraction: 1,
                        autoPlay: false,
                        aspectRatio: 1.0,
                        onPageChanged: (index, reason) {
                          con.currentIndex.value = index;
                        },
                      ),
                      items: List.generate(
                        con.vehicle!.images!.length,
                        (index) => Image.network(
                          con.vehicle!.images![index],
                          width: Get.width,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        con.vehicle!.images!.length,
                        (index) => indicator(index),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const SizedBox(width: 20),
                  properties(
                    image: ImageConstant.user,
                    text: "${con.vehicle!.capacity} ${'sit'.tr}",
                  ),
                  const SizedBox(width: 10),
                  properties(
                    image: ImageConstant.cardoor,
                    text: "${con.vehicle!.kilometer} ${'km'.tr}",
                  ),
                  const SizedBox(width: 10),
                  properties(
                    image: ImageConstant.manualtransmission,
                    text: con.vehicle!.gearType!.capitalizeFirst!,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              // const SizedBox(height: 20),

              // SizedBox(
              //   height: Get.height * .18,
              //   width: Get.width,
              //   child: Image.asset(ImageConstant.car),
              // ),
              const SizedBox(height: 30),
              Text(
                "expertevaluation".tr,
                style: const TextStyle(
                  color: Color(0xff0D1724),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "ratingratingonascalefrom".tr,
                style: const TextStyle(
                  color: Color(0xff13A97B),
                  fontSize: 20,
                  // fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "consumption".tr,
                    style: const TextStyle(
                      color: Color(0xff707070),
                      fontSize: 18,
                    ),
                  ),
                  rating(1),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    "comfort".tr,
                    style: const TextStyle(
                      color: Color(0xff707070),
                      fontSize: 18,
                    ),
                  ),
                  rating(4),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    "safety".tr,
                    style: const TextStyle(
                      color: Color(0xff707070),
                      fontSize: 18,
                    ),
                  ),
                  rating(5),
                ],
              ),
              const SizedBox(height: 20),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Text(
                      "${total_amount} rs",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff0D1724),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " / ${days} days",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff707070),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onPressed: () {
                        createBooking();
                      },
                      // onPressed: () => Get.toNamed(AppRoutes.planListScreen),
                      text: "reservationconfirmation".tr,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppButton(
                      borderColor: Colors.black,
                      border: true,
                      color: Colors.white,
                      onPressed: () => Get.back(),
                      text: "cancellationofreservation".tr,
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
              hSizedBox10,
            ],
          ),
        ),
      ),
    );
  }

  void createBooking() async {
    Get.back();
    LoadingOverlay.of(Get.context!).show();
    http.Response? res = await DashboardRepo.createBooking(
      vehicleId: widget.veh_id!,
      pLocation: widget.delivery_location!,
      rLocation: widget.received_location!,
      pickupDate: widget.delivery_datetime!,
      receiveDate: widget.receive_datetime!,
      withDriver: widget.withdriver!,
    );
    LoadingOverlay.of(Get.context!).hide();

    if (res != null) {
      var decoded = json.decode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        toast("bookingsuccessfully".tr);
        Get.find<MyReservationsScreenController>().currentPage.value = 1;
        Get.find<MyReservationsScreenController>().getBookings(true);
        Get.back();
      } else if ([409, 403, 401, 400].contains(res.statusCode)) {
        toast(decoded['message']);
      } else if (res.statusCode == 422) {
        if (decoded['data'].containsKey("receive_location")) {
          widget.del_loc_error = decoded['data']['receive_location'].first;
        }
        if (decoded['data'].containsKey("pickup_location")) {
          widget.rec_loc_error = decoded['data']['pickup_location'].first;
        }
        if (decoded['data'].containsKey("receive_date")) {
          toast("${decoded['data']['receive_date'].first}");
        }
        if (decoded['data'].containsKey("pickup_date")) {
          toast("${decoded['data']['pickup_date'].first}");
        }
      } else if (res.statusCode == 500) {
        toast(AppConfig.api500Error);
      }
    } else {
      toast(AppConfig.apiError);
    }
    // Get.off(() => DashboardScreen());
  }

  Widget timeplace({
    required String details,
    required String descpt,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            details,
            style: TextStyle(
              color: const Color(0xff707070).withOpacity(.4),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          descpt,
          style: TextStyle(
            color: const Color(0xff707070).withOpacity(.4),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget rating(int i) {
    return Expanded(
      child: Directionality(
        textDirection: Get.locale == const Locale("en")
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Row(
          children: List.generate(i, (index) {
            return Container(
              margin: const EdgeInsets.only(left: 2),
              height: 15,
              width: 30,
              decoration: BoxDecoration(
                color: const Color(0xff13A97B),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(
                    (index == 0 && Get.locale == const Locale("ar")) ||
                            (index == 4 && Get.locale == const Locale("en"))
                        ? 25
                        : 0,
                  ),
                  right: Radius.circular(
                    (index == 0 && Get.locale == const Locale("en")) ||
                            (index == 4 && Get.locale == const Locale("ar"))
                        ? 25
                        : 0,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget properties({required String image, required String text}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const SizedBox(height: 14),
            SvgPicture.asset(
              image,
              height: 40,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),
            Text(text),
          ],
        ),
      ),
    );
  }

  indicator(int index) {
    return Obx(
      () => Container(
        height: 8,
        width: 8,
        margin: const EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(
          color: index == con.currentIndex.value
              ? AppColors.appColor
              : Colors.black12,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
