import 'package:traval/presentation/dashboard/plan_details/plan_details_controller.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class PlanDetailScreen extends StatelessWidget {
  PlanDetailScreen({Key? key}) : super(key: key);
  final PlanDetailController _controller = Get.put(PlanDetailController());

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
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.appColor),
                ),
                child: Column(
                  children: [
                    Container(
                      height: Get.width * .27,
                      width: Get.width * .27,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xffFFAB03).withOpacity(.3),
                            const Color(0xffE68A00),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          ImageConstant.dp,
                          height: Get.width * 0.14,
                        ),
                      ),
                    ),
                    hSizedBox10,
                    Text(
                      "goldmembership".tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlackColor,
                      ),
                    ),
                    hSizedBox30,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "thecost".tr,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff707070).withOpacity(.6),
                            ),
                          ),
                        ),
                        Text(
                          "${0} ${"riyals".tr}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff707070).withOpacity(.6),
                          ),
                        ),
                      ],
                    ),
                    hSizedBox10,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "contracts".tr,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff707070).withOpacity(.6),
                            ),
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff707070).withOpacity(.6),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              hSizedBox20,
              Text(
                "${"advantages".tr} :",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff707070).withOpacity(.6),
                ),
              ),
              hSizedBox10,
              ...List.generate(6, (index) {
                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.appColor,
                      ),
                    ),
                    wSizedBox20,
                    Expanded(
                      child: Text(
                        "freedaily".tr,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff707070),
                        ),
                      ),
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
