import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashController _con = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.splashbg),
          ),
        ),
        child: Obx(
          () => _con.updatecheckscreen.value == 1 ||
                  _con.updatecheckscreen.value == 2
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "appupdateavailable".tr,
                      style: const TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _con.updateNewInfo.value,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    AppButton(
                      onPressed: () {
                        _con.updatecheckscreen.value == 1
                            ? launchUrl(
                                Uri.parse(
                                  "https://play.google.com/store/apps/details?id=com.traval.android",
                                ),
                              )
                            : Get.toNamed(AppRoutes.loginScreen);
                      },
                      text: _con.updatecheckscreen.value == 2
                          ? "next".tr
                          : "update".tr,
                      width: Get.width / 2,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ],
                ),
        ),
      ),
    );
  }
}
