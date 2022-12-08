import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:traval/presentation/dashboard/bookingDetails/booking_details.dart';
import 'package:traval/presentation/dashboard/myReservations/reservations_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/image_constant.dart';
import '../../comman_widget/app_bar.dart';

class MyReservationsScreen extends StatelessWidget {
  MyReservationsScreen({Key? key}) : super(key: key);
  final MyReservationsScreenController _con =
      Get.put(MyReservationsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: 'mybookings'.tr,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,

      // body: Column(
      //   children: [
      // Padding(
      //   padding: const EdgeInsets.only(bottom: 10.0, top: 20),
      //   child: TabBar(
      //       isScrollable: true,
      //       physics: const NeverScrollableScrollPhysics(),
      //       controller: _con.tabController,
      //       labelColor: Colors.white,
      //       unselectedLabelColor: const Color(0xffA7A7A7),
      //       // indicatorSize: TabBarIndicatorSize.label,
      //       padding: EdgeInsets.zero,
      //       labelPadding: const EdgeInsets.symmetric(horizontal: 6),
      //       indicator: BoxDecoration(
      //           borderRadius: BorderRadius.circular(25),
      //           color: Colors.transparent),
      //       tabs: [
      //         ..._con.tabList
      //             .asMap()
      //             .map((index, value) {
      //               return MapEntry(
      //                 index,
      //                 Tab(
      //                   height: 40,
      //                   child: Container(
      //                     constraints: BoxConstraints(
      //                       minWidth: Get.width * 0.40,
      //                     ),
      //                     decoration: BoxDecoration(
      //                       color: _con.currentIndex.value == index
      //                           ? AppColors.appColor
      //                           : Colors.transparent,
      //                       border: Border.all(
      //                         width: 2,
      //                         color: _con.currentIndex.value == index
      //                             ? AppColors.appColor
      //                             : const Color(0xffEDEDED),
      //                       ),
      //                       borderRadius: BorderRadius.circular(10),
      //                     ),
      //                     padding: const EdgeInsets.symmetric(
      //                       horizontal: 15,
      //                     ),
      //                     alignment: Alignment.center,
      //                     child: Text(
      //                       _con.tabList[index],
      //                       style: const TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             })
      //             .values
      //             .toList(),
      //       ]),
      // ),
      // Expanded(
      //   child: TabBarView(
      //       controller: _con.tabController,
      //       physics: const NeverScrollableScrollPhysics(),
      //       children: [
      //         Container(
      //           alignment: Alignment.center,
      //           color: Colors.white,
      //           child: Text(
      //             'therearenodata'.tr,
      //             style: const TextStyle(
      //               color: Color(0xffB3B3B3),
      //               fontSize: 14,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         Container(
      //           color: Colors.green.withOpacity(0.1),
      //         ),
      //       ]),
      // )
      //   ],
      // ),
      body: Obx(
        () => _con.isLoading.value
            ? const AppLoader()
            : _con.bookings.isEmpty
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
                    controller: _con.scrollController,
                    itemCount: _con.bookings.length,
                    // padding: const EdgeInsets.all(20),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (_con.bookings[index].status == "pending") {
                            _con.openDialog(
                              _con.bookings[index].vehicle!.branch,
                              _con.bookings[index].id,
                            );
                          } else {
                            Get.to(
                              () => BookingDetailsScreen(),
                              arguments: _con.bookings[index],
                            );
                          }
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
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 50,
                              //   child: AppBar(
                              //     bottom: TabBar(
                              //       tabs: [
                              //         Tab(
                              //           icon: Icon(Icons.directions_bike),
                              //         ),
                              //         Tab(
                              //           icon: Icon(
                              //             Icons.directions_car,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "bookingid".tr,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "${_con.bookings[index].id}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
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
                                          color: statusColor(index),
                                        ),
                                      ),
                                      Text(
                                        "${_con.bookings[index].status!.capitalizeFirst}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: statusColor(index),
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "pickuplocation".tr,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "${_con.bookings[index].pickupLocation}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "${_con.bookings[index].pickupDate}",
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "deliverylocation".tr,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "${_con.bookings[index].receiveLocation}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "${_con.bookings[index].receiveDate}",
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
                      );
                    },
                  ),
      ),
    );
  }

  renderDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        color: Color(0xffDCDCDC),
        thickness: 1.0,
      ),
    );
  }

  renderMoreView({required String title, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.appColor.withOpacity(0.1),
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    color: Color(0xff707070),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SvgPicture.asset(
              ImageConstant.backIcon,
              height: 18,
              width: 18,
              color: AppColors.appColor,
            ),
          ],
        ),
      ),
    );
  }

  Color statusColor(index) {
    return _con.bookings[index].status == "pending"
        ? Colors.amber
        : _con.bookings[index].status == "cancelled"
            ? Colors.red
            : AppColors.appColor;
  }
}
