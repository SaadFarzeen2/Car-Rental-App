import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:traval/presentation/dashboard/carDetails/car_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:traval/presentation/dashboard/dashboard_con.dart';

import '../../../core/app_export.dart';
import 'car_list_controller.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({Key? key}) : super(key: key);
  final CarListController _controller = Get.put(CarListController());
  final DashboardController con = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "whatisyourchoice".tr,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            hSizedBox20,
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(12)),
                    child: Obx(
                      () => DropdownButton<String>(
                        underline: Container(
                          height: 0,
                        ),
                        iconSize: 0,
                        value: _controller.currentStatus.value,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: (String? v) {
                          _controller.currentStatus.value = v!;
                        },
                        items: _controller.status
                            .map((e) => DropdownMenuItem(
                                  value: e.value,
                                  child: Text(
                                    e.value,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.appColor,
                  ),
                  child: Text(
                    "sort".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            Obx(
              () => Directionality(
                textDirection: Get.locale == const Locale("ar")
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    icon: SizedBox(
                      height: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          ImageConstant.expand,
                        ),
                      ),
                    ),
                    underline: Container(height: 0),
                    value: _controller.currentStatus.value,
                    onChanged: (String? v) {
                      _controller.currentStatus.value = v!;
                    },
                    items: _controller.status
                        .map((e) => DropdownMenuItem(
                              value: e.value,
                              child: Text(
                                e.value,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            hSizedBox14,
            con.isLoading.value
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: const AppLoader()),
                  )
                : con.vehicalList.isEmpty
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                        ),
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
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: con.vehicalList.length,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Get.to(
                              () => CarDetailScreen(),
                              arguments: con.vehicalList[index].id,
                            ),
                            child: AspectRatio(
                              aspectRatio: 1.8,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Text(
                                            "${con.vehicalList[index].title}",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xff444444),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "${con.vehicalList[index].companyName}",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign:
                                                Get.locale == const Locale("ar")
                                                    ? TextAlign.left
                                                    : TextAlign.right,
                                            style: const TextStyle(
                                              color: Color(0xff444444),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                      ],
                                    ),
                                    Expanded(
                                      child: con.vehicalList[index].images!
                                              .isNotEmpty
                                          ? Image.network(
                                              "${con.vehicalList[index].images!.first}",
                                            )
                                          : Container(),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: AppColors.appColor,
                                              borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(
                                                  Get.locale ==
                                                          const Locale("ar")
                                                      ? 16
                                                      : 0,
                                                ),
                                                topLeft: Radius.circular(
                                                  Get.locale ==
                                                          const Locale("ar")
                                                      ? 16
                                                      : 0,
                                                ),
                                                topRight: Radius.circular(
                                                  Get.locale ==
                                                          const Locale("ar")
                                                      ? 0
                                                      : 16,
                                                ),
                                                bottomLeft: Radius.circular(
                                                  Get.locale ==
                                                          const Locale("ar")
                                                      ? 0
                                                      : 16,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              "details".tr,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Align(
                                              alignment: Get.locale ==
                                                      const Locale("ar")
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                              child: Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'SR${con.vehicalList[index].rateperday}',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '/${'day'.tr}',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff707070),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
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
            SizedBox(
              height: 40,
            ),
            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: 5,
            //   separatorBuilder: (context, index) {
            //     return const SizedBox(height: 20);
            //   },
            //   itemBuilder: (context, index) {
            //     return GestureDetector(
            //       onTap: () => Get.to(() => CarDetailScreen()),
            //       child: AspectRatio(
            //         aspectRatio: 1.8,
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(16),
            //             boxShadow: const [
            //               BoxShadow(
            //                 color: Colors.black12,
            //                 blurRadius: 10,
            //               )
            //             ],
            //           ),
            //           child: Column(
            //             children: [
            //               const SizedBox(height: 10),
            //               Row(
            //                 children: [
            //                   const SizedBox(width: 20),
            //                   Expanded(
            //                     child: Text(
            //                       "hyundai".tr,
            //                       overflow: TextOverflow.ellipsis,
            //                       style: const TextStyle(
            //                         color: Color(0xff444444),
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ),
            //                   Text(
            //                     "sonata".tr,
            //                     overflow: TextOverflow.ellipsis,
            //                     style: const TextStyle(
            //                       color: Color(0xff444444),
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                   const SizedBox(width: 20),
            //                 ],
            //               ),
            //               Expanded(
            //                 child: Image.asset(
            //                   ImageConstant.car,
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Expanded(
            //                     child: Container(
            //                       alignment: Alignment.center,
            //                       height: 40,
            //                       decoration: BoxDecoration(
            //                         color: AppColors.appColor,
            //                         borderRadius: BorderRadius.only(
            //                           bottomRight: Radius.circular(
            //                             Get.locale == const Locale("ar")
            //                                 ? 16
            //                                 : 0,
            //                           ),
            //                           topLeft: Radius.circular(
            //                             Get.locale == const Locale("ar")
            //                                 ? 16
            //                                 : 0,
            //                           ),
            //                           topRight: Radius.circular(
            //                             Get.locale == const Locale("ar")
            //                                 ? 0
            //                                 : 16,
            //                           ),
            //                           bottomLeft: Radius.circular(
            //                             Get.locale == const Locale("ar")
            //                                 ? 0
            //                                 : 16,
            //                           ),
            //                         ),
            //                       ),
            //                       child: const Text(
            //                         "details",
            //                         style: TextStyle(
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.bold,
            //                           color: Colors.white,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Expanded(
            //                     child: Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20),
            //                       child: Align(
            //                         alignment: Get.locale == const Locale("ar")
            //                             ? Alignment.centerLeft
            //                             : Alignment.centerRight,
            //                         child: const Text.rich(
            //                           TextSpan(
            //                             children: [
            //                               TextSpan(
            //                                 text: '80rs',
            //                                 style: TextStyle(
            //                                   fontSize: 16,
            //                                   fontWeight: FontWeight.bold,
            //                                 ),
            //                               ),
            //                               TextSpan(
            //                                 text: '/day',
            //                                 style: TextStyle(
            //                                   fontSize: 16,
            //                                   fontWeight: FontWeight.bold,
            //                                   color: Color(0xff707070),
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
