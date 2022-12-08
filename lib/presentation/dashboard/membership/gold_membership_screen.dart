import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:traval/core/utils/image_constant.dart';
import 'package:traval/presentation/dashboard/Payment/payment_type.dart';

class Gold_Membership_Screen extends StatelessWidget {
  const Gold_Membership_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08,
              vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.30,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 19, 169, 124),
                          // border:
                          //     Border.all(color: Color.fromRGBO(47, 91, 49, 1)),
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
                            child: Column(
                              children: [
                                Container(
                                  height: Get.width * .2,
                                  width: Get.width * .2,
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
                                      height: Get.width * 0.12,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
                            height: 25,
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
                                      color: Colors.white,
                                      fontSize: 14,
                                    )),
                                Spacer(),
                                Text(
                                  "rayal".tr + " 0",
                                  style: TextStyle(color: Colors.white),
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
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "0",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "advantages".tr + " :",
                style: TextStyle(
                    color: Color.fromARGB(255, 106, 105, 105),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 19, 169, 124),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "free150km".tr + " .",
                    style: TextStyle(
                      color: Color.fromARGB(255, 106, 105, 105),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 19, 169, 124),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "20" + "discountontotalrentalvalue".tr + " .",
                    style: TextStyle(
                      color: Color.fromARGB(255, 106, 105, 105),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 110,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    // Get.to(Payment_type());
                  },
                  child: Container(
                    child: Text(
                      "getmembership".tr,
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
