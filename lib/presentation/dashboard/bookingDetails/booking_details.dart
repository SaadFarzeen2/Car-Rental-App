import 'package:carousel_slider/carousel_slider.dart';
import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:traval/presentation/dashboard/bookingDetails/booking_details_con.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingDetailsScreen extends StatelessWidget {
  BookingDetailsScreen({super.key});
  final BoookingDetailsController con = Get.put(BoookingDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "bookingDetails".tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Obx(
        () => con.isLoading.value
            ? const AppLoader()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: tileWidget(
                                  text: "${Get.arguments.id}",
                                  title: "bookingid".tr,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: statusColor(),
                                    ),
                                  ),
                                  Text(
                                    "${Get.arguments.status!.toString().capitalizeFirst}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: statusColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: tileWidget(
                                  text: "${Get.arguments.pickupLocation}",
                                  title: "pickuplocation".tr,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  "${Get.arguments.pickupDate}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: tileWidget(
                                  text: "${Get.arguments.receiveLocation}",
                                  title: "deliverylocation".tr,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  "${Get.arguments.receiveDate}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    titleWidget('${'cardetails'.tr} :'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: tileWidget(
                        text: '${con.vehicle!.companyName}',
                        title: "companyname".tr,
                      ),
                    ),
                    hSizedBox10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: tileWidget(
                        text: '${con.vehicle!.title}',
                        title: "carmodel".tr,
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
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "details".tr,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("${con.vehicle!.description}"),
                    ),
                    const SizedBox(height: 20),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          wSizedBox20,
                          Text(
                            "SR${con.vehicle!.rateperday}",
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
                    titleWidget('${"branchdetails".tr} :'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: tileWidget(
                                  title: "branchname".tr,
                                  text: '${con.vehicle!.branch!.title}',
                                ),
                              ),
                              IconButton(
                                onPressed: () => con.launchURL(
                                  lat: con.vehicle!.branch!.lat,
                                  long: con.vehicle!.branch!.long,
                                ),
                                icon: const Icon(Icons.directions),
                                color: AppColors.appColor,
                              ),
                            ],
                          ),
                          hSizedBox10,
                          tileWidget(
                            title: "contactnumber".tr,
                            text: '${con.vehicle!.branch!.contactNo}',
                          ),
                        ],
                      ),
                    ),
                    if (con.driverName.value.isNotEmpty)
                      titleWidget("${'driverdetails'.tr} :"),
                    if (con.driverName.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            tileWidget(
                              title: "fullname".tr,
                              text: '${con.driverName}',
                            ),
                            hSizedBox10,
                            tileWidget(
                              title: "contactnumber".tr,
                              text: '${con.driverNumber}',
                            ),
                            hSizedBox10,
                            tileWidget(
                              title: "emailAddress".tr,
                              text: '${con.driverEmail}',
                            ),
                          ],
                        ),
                      ),
                    hSizedBox10,
                    const Divider(),
                    hSizedBox30,
                  ],
                ),
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

  Color statusColor() {
    return Get.arguments.status == "pending"
        ? Colors.amber
        : Get.arguments.status == "cancelled"
            ? Colors.red
            : AppColors.appColor;
  }

  Widget tileWidget({String? title, String? text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          "$text",
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget titleWidget(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hSizedBox10,
        const Divider(),
        hSizedBox10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        hSizedBox10,
        const Divider(),
        hSizedBox10,
      ],
    );
  }
}
