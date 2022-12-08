import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/auth/verification/verification_controller.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';

class VerifyRegisterScreen extends StatelessWidget {
  VerifyRegisterScreen({Key? key}) : super(key: key);
  final VerificationController con = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "verifyEmail".tr,
          style: TextStyle(color: AppColors.textBlackColor),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.1),
              Container(
                height: Get.width * .3,
                // width: Get.width * .3,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.appIcon),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              Text(
                "checkmailwehavesentotp".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.4,
                  color: AppColors.textGreyColor,
                ),
              ),
              hSizedBox20,
              AppTextField(
                hintText: "enterotp".tr,
                border: true,
                color: Colors.transparent,
                onChange: (value) {
                  con.otp.value = value;
                },
                errorMessage: "".obs,
              ),
              SizedBox(height: Get.height * 0.1),
              AppButton(
                width: Get.width / 2,
                text: "verify".tr,
                onPressed: () => con.onVerify(),
              ),
              SizedBox(
                height: Get.height * .1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
