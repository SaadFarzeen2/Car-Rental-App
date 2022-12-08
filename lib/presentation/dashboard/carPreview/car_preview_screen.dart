import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../comman_widget/app_button.dart';

class CarPreviewScreen extends StatelessWidget {
  const CarPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(
      //   text: "معاينة السيارة".tr,
      //   onPressed: () {},
      // ),
      appBar: AppBar(
        title: Text(
          "carpreview".tr,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            renderCardView(
                title: 'frontpictureofthecar'.tr,
                image: ImageConstant.appIcon,
                onTap: () {}),
            renderCardView(
                title: 'carpicturefromtheback'.tr,
                image: ImageConstant.appIcon,
                onTap: () {}),
            renderCardView(
                title: 'pictureofthecarfromtheright'.tr,
                image: ImageConstant.appIcon,
                onTap: () {}),
            renderCardView(
                title: 'pictureofthecarfromtheleft'.tr,
                image: ImageConstant.appIcon,
                onTap: () {}),
            hSizedBox16,
            AppButton(
              radius: 10,
              onPressed: () {
                Get.offAllNamed(AppRoutes.dashboardScreen);
              },
              text: 'nextone'.tr,
            ),
            hSizedBox16,
          ],
        ),
      )),
    );
  }

  renderCardView({required String title, String? image, Function()? onTap}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 6),
      height: 150,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.appColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xffD7D7D7),
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 1, color: const Color(0xffDEDEDE))),
                  child: Image.asset(ImageConstant.cameraIcon,
                      color: Colors.black),
                ),
              ),
              wSizedBox8,
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
