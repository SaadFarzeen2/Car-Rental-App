import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/dashboard/initial_car_details/initial_car_details_controller.dart';
import 'package:flutter/material.dart';

import '../../comman_widget/app_button.dart';

class InitialCarDetailScreen extends StatelessWidget {
  InitialCarDetailScreen({Key? key}) : super(key: key);
  final InitialCarDetailController _controller =
      Get.put(InitialCarDetailController());
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
                "hyundai".tr,
                style: const TextStyle(
                  color: Color(0xff0D1724),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "sonata".tr,
                style: const TextStyle(
                  color: Color(0xff0D1724),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              hSizedBox30,
              timeplace(
                details: "receivinglocation".tr,
                descpt: "Dubai",
              ),
              timeplace(
                details: "deliverylocation".tr,
                descpt: "Shahjaha",
              ),
              timeplace(
                details: "receiptanddeliverydatetime".tr,
                descpt: "09:24 AM",
              ),
              SizedBox(
                height: Get.height * .18,
                width: Get.width,
                child: Image.asset(ImageConstant.car),
              ),
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
                  children: const [
                    Text(
                      "80 rs",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff0D1724),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "/day",
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
                      onPressed: () => Get.toNamed(AppRoutes.planListScreen),
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
}
