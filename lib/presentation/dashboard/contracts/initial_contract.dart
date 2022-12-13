import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/comman_widget/app_bar.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:traval/presentation/dashboard/contracts/branches_controller.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InitialContractScreen extends StatelessWidget {
  final Function() onButton;
  InitialContractScreen({Key? key, required this.onButton}) : super(key: key);
  final BranchesController con = Get.put(BranchesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        text: 'branches'.tr,
        centerTitle: true,
      ),
      // body: Column(
      //   children: [
      //     SizedBox(height: Get.height * 0.2),
      //     Center(
      //       child: Text(
      //         "bookingrentalconfirmed".tr,
      //         style: const TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: Get.height * 0.2),
      //     AppButton(
      //       width: Get.width * 0.8,
      //       text: "preview".tr,
      //       onPressed: onButton,
      //     ),
      //   ],
      // ),
      body: Obx(
        () => con.isLoading.value
            ? const AppLoader()
            : con.branches.isEmpty
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
                    itemCount: con.branches.length,
                    padding: const EdgeInsets.all(20),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (context, index) {
                      return Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            hSizedBox8,
                            Text(
                              con.branches[index].title!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            hSizedBox8,
                            const Divider(),
                            hSizedBox10,
                            Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: AppColors.appColor,
                                ),
                                wSizedBox10,
                                Expanded(
                                  child: Text(
                                    con.branches[index].contactNo!,
                                  ),
                                ),
                              ],
                            ),
                            hSizedBox20,
                            Text(
                              "openClose".tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            hSizedBox8,
                            timeWidget(
                              title: "sunday".tr,
                              timeFrom: con.branches[index].sundayStartTime!,
                              timeTo: con.branches[index].sundayEndTime!,
                            ),
                            hSizedBox6,
                            timeWidget(
                              title: "monday".tr,
                              timeFrom: con.branches[index].mondayStartTime!,
                              timeTo: con.branches[index].mondayEndTime!,
                            ),
                            hSizedBox6,
                            timeWidget(
                              title: "tuesday".tr,
                              timeFrom: con.branches[index].tuesdayStartTime!,
                              timeTo: con.branches[index].tuesdayEndTime!,
                            ),
                            hSizedBox6,
                            timeWidget(
                              title: "wednesday".tr,
                              timeFrom: con.branches[index].wednesdayStartTime!,
                              timeTo: con.branches[index].wednesdayEndTime!,
                            ),
                            hSizedBox6,
                            timeWidget(
                              title: "thursday".tr,
                              timeFrom: con.branches[index].thursdayStartTime!,
                              timeTo: con.branches[index].thursdayEndTime!,
                            ),
                            hSizedBox6,
                            timeWidget(
                              title: "friday".tr,
                              timeFrom: con.branches[index].fridayStartTime!,
                              timeTo: con.branches[index].fridayEndTime!,
                            ),
                            hSizedBox6,
                            timeWidget(
                              title: "saturday".tr,
                              timeFrom: con.branches[index].saturdayStartTime!,
                              timeTo: con.branches[index].saturdayEndTime!,
                            ),
                            // hSizedBox14,
                            // AppButton(
                            //   height: 40,
                            //   color: Colors.white,
                            //   textColor: AppColors.appColor,
                            //   border: true,
                            //   onPressed: () => launchURL(
                            //     lat: con.branches[index].lat,
                            //     long: con.branches[index].long,
                            //   ),
                            //   text: "gettheroute".tr,
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
      ),
    );
  }

  Widget timeWidget({
    required String? title,
    required String? timeFrom,
    required String? timeTo,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${title ?? ''} - '),
          TextSpan(
            text: "${con.timeString(
              time: timeFrom,
            )} to ${con.timeString(
              time: timeTo,
            )}",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  launchURL({lat, long}) async {
    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";

    if (await canLaunchUrl(Uri.parse(googleMapslocationUrl))) {
      await launchUrl(Uri.parse(googleMapslocationUrl));
    } else {
      print('Could not launch $googleMapslocationUrl');
      throw 'Could not launch $googleMapslocationUrl';
    }
  }
}
