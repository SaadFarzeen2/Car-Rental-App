import 'dart:io';

import 'package:traval/presentation/auth/forgetPassword/forget_password.dart';
import 'package:traval/presentation/auth/login/login_controller.dart';
import 'package:traval/presentation/auth/register/register_screen.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_export.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginScreenController _con = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        backgroundColor:
            Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: Get.height * 0.15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'logintoyouraccount'.tr,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        hSizedBox14,
                        AppTextField(
                          hintText: "emailAddress".tr,
                          obsecureText: false,
                          prefixIcon: ImageConstant.userName,
                          border: true,
                          color: Colors.transparent,
                          initialValue: _con.email.value,
                          onChange: (value) {
                            _con.email.value = value;
                            _con.emailError.value = '';
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z0-9@_.-]"),
                            ),
                          ],
                          errorMessage: _con.emailError,
                        ),
                        hSizedBox10,
                        AppTextField(
                          prefixIcon: ImageConstant.password,
                          hintText: "password".tr,
                          border: true,
                          color: Colors.transparent,
                          obsecureText: _con.obsure.value,
                          initialValue: _con.password.value,
                          onChange: (value) {
                            _con.password.value = value;
                            _con.passwordError.value = '';
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z0-9@_.-]"),
                            ),
                          ],
                          errorMessage: _con.passwordError,
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: const Size(0, 0)),
                            onPressed: () => Get.to(
                              () => ForgetPassword(),
                            ),
                            child: Text(
                              "didyouforgetyourpassword".tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xff707070),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.05),
                        AppButton(
                          radius: 10,
                          onPressed: () {
                            _con.login();
                          },
                          text: 'login'.tr,
                        ),
                        // hSizedBox16,
                        // AppButton(
                        //   border: true,
                        //   color: Colors.white,
                        //   textColor: AppColors.appColor,
                        //   radius: 10,
                        //   onPressed: () {
                        //     Get.toNamed(AppRoutes.dashboardScreen);
                        //   },
                        //   text: 'continueasaguest'.tr,
                        // ),
                        SizedBox(height: Get.height * 0.05),
                        Divider(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'loginwithyoursocialmediaaccount'.tr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _con.googlelogin(),
                              child: Container(
                                height: 35,
                                width: 35,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xffDEDEDE),
                                  ),
                                ),
                                child: Image.asset(
                                  ImageConstant.googleIcon,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            if (Platform.isIOS) wSizedBox6,
                            if (Platform.isIOS)
                              GestureDetector(
                                onTap: () => _con.loginWithApple(),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffDEDEDE),
                                    ),
                                  ),
                                  child: Image.asset(
                                    ImageConstant.appleIcon,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.06),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => RegisterScreen());
                          },
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Color(0xffB3B3B3), width: 1.0),
                              ),
                            ),
                            child: Text(
                              " ${"idonthaveanyaccountcreatenew".tr}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff707070),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.05),
                    const Spacer(),
                    Image.asset(
                      ImageConstant.saudiVision,
                      height: 100,
                      width: 100,
                    ),
                    hSizedBox10,
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
