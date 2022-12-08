import 'dart:io';

import 'package:traval/core/utils/local_storage.dart';
import 'package:traval/presentation/auth/changePassword/change_password_screen.dart';
import 'package:traval/presentation/dashboard/profileScreen/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_export.dart';
import '../../comman_widget/app_bar.dart';
import '../../comman_widget/app_dialog.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ProfileController con = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: ''),
      floatingActionButton: GestureDetector(
        onTap: () {
          Platform.isIOS
              ? showDialog(
                  barrierColor: const Color.fromRGBO(0, 0, 0, 0.76),
                  context: Get.context!,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        "logout".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      content: Text(
                        "areyoulogout".tr,
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text(
                            "cancel".tr,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () => Get.back(),
                        ),
                        CupertinoDialogAction(
                            child: Text(
                              "logout".tr,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {
                              LocalStorage.clearLocalData();
                              Get.offAllNamed(
                                AppRoutes.loginScreen,
                              );
                            })
                      ],
                    );
                  })
              : logoutDialog(
                  context: Get.context,
                  onTap: () {
                    LocalStorage.clearLocalData();
                    Get.offAllNamed(AppRoutes.loginScreen);
                  },
                );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(ImageConstant.logout),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    ImageConstant.logoIcon,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              // renderMoreView(title: 'fleet'.tr, onTap: () {}),
              // renderDivider(),
              // renderMoreView(
              //   title: 'branches'.tr,
              //   onTap: () => Get.toNamed(
              //     AppRoutes.searchScreen,
              //   ),
              // ),
              // renderDivider(),
              renderMoreView(
                title: 'myprofile'.tr,
                onTap: () => Get.toNamed(AppRoutes.addEditProfileScreen),
              ),
              renderDivider(),
              renderMoreView(
                title: 'membership'.tr,
                onTap: () => Get.toNamed(AppRoutes.membershipScreen),
              ),
              renderDivider(),
              renderMoreView(
                title: 'notifications'.tr,
                onTap: () {
                  Get.toNamed(AppRoutes.notificationScreen);
                },
              ),
              renderDivider(),
              renderMoreView(
                title: 'changepassword'.tr,
                onTap: () {
                  Get.to(
                    () => ChangePasswordScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // body: Obx(
      //   () => con.isLoading.value
      //       ? const AppLoader()
      //       : SafeArea(
      //           child: SingleChildScrollView(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 20),
      //                   child: Align(
      //                     alignment: Alignment.centerLeft,
      //                     child: Image.asset(
      //                       ImageConstant.logoIcon,
      //                       height: 100,
      //                       width: 100,
      //                     ),
      //                   ),
      //                 ),
      //                 // SizedBox(height: Get.height * 0.05),
      //                 // renderMoreView(
      //                 //     title: ''.tr,
      //                 //     onTap: () => Get.toNamed(AppRoutes.addEditProfileScreen)),
      //                 // renderDivider(),
      //                 // renderMoreView(
      //                 //   title: 'organic'.tr,
      //                 //   onTap: () => con.isExpanded.value = !con.isExpanded.value,
      //                 // ),
      //                 // renderDivider(),
      //                 // Obx(
      //                 //   () => ExpandedSection(
      //                 //     expand: con.isExpanded.value,
      //                 //     child: Padding(
      //                 //       padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
      //                 //       child: Column(
      //                 //         children: [
      //                 //           renderMoreView(title: 'amyli'.tr, onTap: () {}),
      //                 //           renderDivider(),
      //                 //           renderMoreView(title: 'myfriends'.tr, onTap: () {}),
      //                 //           renderDivider(),
      //                 //         ],
      //                 //       ),
      //                 //     ),
      //                 //   ),
      //                 // ),
      //                 // renderMoreView(title: 'notices'.tr, onTap: () {}),
      //                 // renderDivider(),
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 20),
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: Text(
      //                           "personalDetails".tr,
      //                           style: const TextStyle(
      //                             fontSize: 16,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                         ),
      //                       ),
      //                       IconButton(
      //                         onPressed: () =>
      //                             Get.toNamed(AppRoutes.addEditProfileScreen),
      //                         color: AppColors.appColor,
      //                         icon: const Icon(
      //                           Icons.mode_edit_outlined,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 hSizedBox4,
      //                 Container(
      //                   margin: const EdgeInsets.symmetric(horizontal: 20),
      //                   padding: const EdgeInsets.all(16),
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(12),
      //                     boxShadow: const [
      //                       BoxShadow(
      //                         color: Colors.black12,
      //                         blurRadius: 5,
      //                       ),
      //                     ],
      //                   ),
      //                   child: Row(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Expanded(
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               "firstname".tr,
      //                               style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                               ),
      //                             ),
      //                             Text(
      //                               con.firstName.value,
      //                               style: TextStyle(
      //                                   color: AppColors.textGreyColor),
      //                             ),
      //                             hSizedBox18,
      //                             Text(
      //                               "lastname".tr,
      //                               style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                               ),
      //                             ),
      //                             Text(
      //                               con.lastName.value,
      //                               style: TextStyle(
      //                                   color: AppColors.textGreyColor),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               "address".tr,
      //                               style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                               ),
      //                             ),
      //                             Text(
      //                               con.address.value,
      //                               style: TextStyle(
      //                                 color: AppColors.textGreyColor,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(20),
      //                   child: Text(
      //                     "contactinformation".tr,
      //                     style: const TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   margin: const EdgeInsets.symmetric(horizontal: 20),
      //                   padding: const EdgeInsets.all(16),
      //                   width: Get.width,
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(12),
      //                     boxShadow: const [
      //                       BoxShadow(
      //                         color: Colors.black12,
      //                         blurRadius: 5,
      //                       ),
      //                     ],
      //                   ),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         "emailAddress".tr,
      //                         style: const TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                       Text(
      //                         con.email.value,
      //                         style: TextStyle(color: AppColors.textGreyColor),
      //                       ),
      //                       hSizedBox18,
      //                       Text(
      //                         "phoneNo".tr,
      //                         style: const TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                       Text(
      //                         con.mobile.value,
      //                         style: TextStyle(color: AppColors.textGreyColor),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 // renderMoreView(
      //                 //   title: 'changepassword'.tr,
      //                 //   onTap: () => Get.to(
      //                 //     () => ChangePasswordScreen(),
      //                 //   ),
      //                 // ),
      //               ],
      //             ),
      //           ),
      //         ),
      // ),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontSize: 16,
                ),
              ),
            ),
            // SvgPicture.asset(
            //   ImageConstant.backIcon,
            //   height: 12,
            //   color: AppColors.appColor,
            // ),
            Icon(
              Icons.chevron_right,
              color: AppColors.appColor,
            )
          ],
        ),
      ),
    );
  }
}
