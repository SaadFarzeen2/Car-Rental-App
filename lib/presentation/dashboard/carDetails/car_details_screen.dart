import 'package:carousel_slider/carousel_slider.dart';
import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:traval/presentation/dashboard/carDetails/car_details_con.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:traval/presentation/dashboard/contracts/branches_controller.dart';

import '../../../core/app_export.dart';
import '../../comman_widget/app_button.dart';

class CarDetailScreen extends StatefulWidget {
  CarDetailScreen({Key? key}) : super(key: key);

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  final CarDetailsController con = Get.put(CarDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Obx(
        () => con.carLoading.value
            ? const AppLoader()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '${con.vehicle!.companyName}',
                          style: const TextStyle(
                            color: Color(0xff0D1724),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '${con.vehicle!.title}',
                          style: const TextStyle(
                            color: Color(0xff0D1724),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 20),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Text(
                      //     "details".tr,
                      //     style: const TextStyle(
                      //       color: Color(0xff0D1724),
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 10),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Text("${con.vehicle!.branch}"),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          children: [
                            wSizedBox20,
                            Text(
                              "SR ${con.vehicle!.rateperday}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xff0D1724),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "/${'day'.tr}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xff707070),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: AppButton(
                      //           onPressed: () => con.openBottomSheet(context),
                      //           text: "reservationconfirmation".tr,
                      //         ),
                      //       ),
                      //       const SizedBox(width: 10),
                      //       Expanded(
                      //         child: AppButton(
                      //           borderColor: Colors.black,
                      //           border: true,
                      //           color: Colors.white,
                      //           onPressed: () => Get.back(),
                      //           text: "cancellationofreservation".tr,
                      //           textColor: Colors.black,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // hSizedBox10,

                      hSizedBox20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AppButton(
                          onPressed: () => con.openBottomSheet(context),
                          text: "bookCar".tr,
                        ),
                      ),
                      hSizedBox30,
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: AppButton(
                  //         onPressed: () => con.openBottomSheet(),
                  //         text: "Book Car".tr,
                  //       ),
                  //     ),
                  // const SizedBox(width: 10),
                  // Expanded(
                  //   child: AppButton(
                  //     borderColor: Colors.black,
                  //     border: true,
                  //     color: Colors.white,
                  //     onPressed: () {},
                  //     text: "cancellationofreservation".tr,
                  //     textColor: Colors.black,
                  //   ),
                  // ),
                  //   ],
                  // ),
                  //     hSizedBox10,
                  //   ],
                  // ),
                ),
              ),
      ),
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
