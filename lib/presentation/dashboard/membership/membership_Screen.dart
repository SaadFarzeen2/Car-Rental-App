import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traval/core/utils/image_constant.dart';

import '../../../routes/app_routes.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.silvermembershipScreen);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                              vertical: 20),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: Get.width * .1,
                                width: Get.width * .1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 172, 167, 155)
                                          .withOpacity(.3),
                                      Color.fromARGB(255, 73, 68, 59),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    ImageConstant.dp,
                                    height: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Center(
                                child: Text(
                                  "silvermembership".tr,
                                  style: TextStyle(
                                      // color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("costs".tr,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  )),
                              Spacer(),
                              Text(
                                "rayal".tr + " 0",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "contracts".tr,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "0",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.goldmembershipScreen);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                              vertical: 20),
                          child: Row(
                            children: [
                              Container(
                                height: Get.width * .1,
                                width: Get.width * .1,
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
                                    height: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FittedBox(
                                child: Text(
                                  "goldenmembership".tr,
                                  style: TextStyle(
                                      // color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("costs".tr,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  )),
                              Spacer(),
                              Text(
                                "rayal".tr + " 0",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "contracts".tr,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "0",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.platinummembershipScreen);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                              vertical: 20),
                          child: Row(
                            children: [
                              Container(
                                height: Get.width * .1,
                                width: Get.width * .1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(174, 118, 118, 109)
                                          .withOpacity(.3),
                                      Color.fromARGB(255, 138, 84, 4),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    ImageConstant.dp,
                                    height: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FittedBox(
                                child: Text(
                                  "platinummembership".tr,
                                  style: TextStyle(
                                      // color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("costs".tr,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  )),
                              Spacer(),
                              Text(
                                "rayal".tr + " 0",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "contracts".tr,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "0",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Text(
                  "donnothavemember".tr,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Text(
                  "learnmoreaboutmiles".tr,
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
