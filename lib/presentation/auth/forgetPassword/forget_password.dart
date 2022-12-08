import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/auth/forgetPassword/forget_password_con.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final ForgetPasswordController _con = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),
              SizedBox(
                height: Get.height * 0.10,
                child: Center(
                  child: Image.asset(
                    ImageConstant.appIcon,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              hSizedBox20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "entermailtoreceivecode".tr,
                  style: TextStyle(
                    height: 1.4,
                    color: AppColors.textGreyColor,
                  ),
                ),
              ),
              hSizedBox20,
              AppTextField(
                prefixIcon: ImageConstant.mailIcon,
                hintText: "email".tr,
                obsecureText: false,
                onChange: (value) {
                  _con.email.value = value.trim();
                  _con.emailError.value = '';
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp("[a-zA-Z0-9@_.-]"),
                  ),
                ],
                errorMessage: _con.emailError,
              ),
              hSizedBox20,
              Obx(
                () => _con.isOtpField.value
                    ? Column(
                        children: [
                          Text(
                            "entermailtoreceivecode".tr,
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
                              _con.otp.value = value;
                            },
                            errorMessage: "".obs,
                          ),
                        ],
                      )
                    : Container(),
              ),
              SizedBox(height: Get.height * 0.05),
              Center(
                child: AppButton(
                  width: Get.width / 2,
                  text: "send".tr,
                  onPressed: () {
                    if (_con.isOtpField.value) {
                      _con.onVerify();
                    } else {
                      _con.forgotPassword();
                    }
                  },
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "backtologin".tr,
                    style: TextStyle(
                      color: AppColors.textGreyColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
