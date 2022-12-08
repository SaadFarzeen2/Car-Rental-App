// import 'package:traval/presentation/dashboard/moreScreen/more_controller.dart';
import 'package:flutter/material.dart';
import 'package:traval/presentation/dashboard/inquiry/inquiry_screen.dart';
import 'package:traval/presentation/dashboard/moreScreen/aboutUs/aboutus_screen.dart';

import '../../../core/app_export.dart';
// import '../../comman_widget/app_bar.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
  // final MoreController _controller = Get.put(MoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 70,
        automaticallyImplyLeading: false,
        elevation: 5,
        shadowColor: const Color(0xffEBEBEB).withOpacity(0.5),
      ),
      backgroundColor: Colors.white,
      // body: Center(
      //   child: Image.asset(
      //     ImageConstant.logoIcon,
      //     height: 100,
      //     width: 100,
      //   ),
      // ),
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
              SizedBox(
                height: Get.height * 0.01,
              ),
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
                title: 'queries'.tr,
                onTap: () => Get.to(
                  () => InquiryScreen(),
                ),
              ),
              // renderDivider(),
              // renderMoreView(title: 'connectwithus'.tr, onTap: () {}),
              // renderDivider(),
              // renderMoreView(title: 'settings'.tr, onTap: () {}),
              renderDivider(),
              renderMoreView(
                title: 'languages'.tr,
                onTap: () {
                  Get.toNamed(AppRoutes.languageScreen);
                },
              ),
              renderDivider(),
              renderMoreView(
                title: 'abouttravel'.tr,
                onTap: () => Get.to(() => AboutUsScreen()),
              ),
            ],
          ),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontSize: 16,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.appColor,
            )
            // SvgPicture.asset(
            //   ImageConstant.backIcon,
            //   height: 12,
            //   color: AppColors.appColor,
            // ),
          ],
        ),
      ),
    );
  }
}
