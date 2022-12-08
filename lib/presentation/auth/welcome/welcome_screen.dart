import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

import 'welcome_controller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  final WelcomeController _con = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(ImageConstant.splashbg))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                height: 150,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  ImageConstant.appIcon,
                ),
              ),
              selectView(
                image: ImageConstant.leasingSelf,
                title: "leasingself".tr,
                onTap: () {
                  Get.toNamed(AppRoutes.loginScreen);
                },
              ),
              hSizedBox16,
              selectView(
                image: ImageConstant.leasingSmart,
                title: "leasingsmart".tr,
                onTap: () {
                  Get.toNamed(AppRoutes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectView(
      {required String image, required String title, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.60,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          border:
              Border.all(color: Get.isDarkMode ? Colors.white54 : Colors.white),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0.5, 0.6),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
              color: AppColors.appColor,
            ),
            wSizedBox10,
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
