import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/dashboard/plan_list/plan_list_controller.dart';
import 'package:flutter/material.dart';

class PlanListScreen extends StatelessWidget {
  PlanListScreen({Key? key}) : super(key: key);
  final PlanListController _controller = Get.put(PlanListController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight - 120,
              maxHeight: double.infinity,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.planDetailScreen),
                      child: AspectRatio(
                        aspectRatio: 4 / 1.7,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.appColor),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
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
                                          const Color(0xffFFAB03)
                                              .withOpacity(.3),
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
                                  wSizedBox10,
                                  Text(
                                    "goldmembership".tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textBlackColor,
                                    ),
                                  ),
                                ],
                              ),
                              hSizedBox20,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "thecost".tr,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff707070)
                                            .withOpacity(.6),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${0} ${"riyals".tr}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff707070)
                                          .withOpacity(.6),
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
                                        color: const Color(0xff707070)
                                            .withOpacity(.6),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff707070)
                                          .withOpacity(.6),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                hSizedBox30,
                Column(
                  children: [
                    Text(
                      "youhavenomembers".tr,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff707070).withOpacity(.6),
                      ),
                    ),
                    hSizedBox14,
                    Text(
                      "learnmoreaboutamyali".tr,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appColor,
                      ),
                    ),
                    hSizedBox20,
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
