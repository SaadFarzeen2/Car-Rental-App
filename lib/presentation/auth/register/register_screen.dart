import 'dart:io';

import 'package:traval/core/app_export.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/presentation/auth/login/login_controller.dart';
import 'package:traval/presentation/auth/register/register_controller.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final RegisterController _con = Get.put(RegisterController());

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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
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
                              "${'i'.tr}...",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          hSizedBox14,
                          SizedBox(
                            width: Get.width,
                            child: Obx(
                              () => Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.start,
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: [
                                  typeWidget(
                                    _con.userType.value ==
                                        "Cooperation Council/Visitor",
                                    "cooperationcouncilvisitor".tr,
                                    () => _con.userType.value =
                                        "Cooperation Council/Visitor",
                                  ),
                                  typeWidget(
                                    _con.userType.value == "Saudi / resident",
                                    "saudiresident".tr,
                                    () => _con.userType.value =
                                        "Saudi / resident",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AppTextField(
                            hintText: "fullname".tr,
                            obsecureText: false,
                            prefixIcon: ImageConstant.accountIcon,
                            border: true,
                            color: Colors.transparent,
                            onChange: (value) {
                              _con.fullName.value = value;
                              _con.fullNameError.value = "";
                            },
                            errorMessage: _con.fullNameError,
                          ),
                          // AppTextField(
                          //   hintText: "lastname".tr,
                          //   obsecureText: false,
                          //   prefixIcon: ImageConstant.accountIcon,
                          //   border: true,
                          //   color: Colors.transparent,
                          //   onChange: (value) {
                          //     _con.lastName.value = value;
                          //     _con.lastNameError.value = "";
                          //   },
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.allow(
                          //       RegExp("[a-zA-Z0-9@_.-]"),
                          //     ),
                          //   ],
                          //   errorMessage: _con.lastNameError,
                          // ),
                          AppTextField(
                            hintText: "emailAddress".tr,
                            obsecureText: false,
                            prefixIcon: ImageConstant.mailIcon,
                            border: true,
                            color: Colors.transparent,
                            initialValue: "",
                            onChange: (value) {
                              _con.email.value = value;
                              _con.emailError.value = "";
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z0-9@_.-]"),
                              ),
                            ],
                            errorMessage: _con.emailError,
                          ),
                          AppTextField(
                            hintText: "identificationnumber".tr,
                            obsecureText: false,
                            keyboardType: TextInputType.number,
                            prefixIcon: ImageConstant.userName,
                            border: true,
                            color: Colors.transparent,
                            onChange: (value) {
                              _con.idNumber.value = value;
                              _con.idNumberError.value = "";
                            },
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                RegExp("[0-9]"),
                              ),
                            ],
                            errorMessage: _con.idNumberError,
                          ),
                          AppTextField(
                            hintText: "dateofbirth".tr,
                            obsecureText: false,
                            controller: _con.dobController,
                            prefixIcon: ImageConstant.calendarFill,
                            border: true,
                            color: Colors.transparent,
                            ontap: () => Helper.openDOBPicker(
                              _con.dobController,
                              _con.dob,
                            ),
                            readonly: true,
                            errorMessage: "".obs,
                          ),
                          AppTextField(
                            hintText: "phoneNo".tr,
                            obsecureText: false,
                            prefixIcon: ImageConstant.callIcon,
                            border: true,
                            color: Colors.transparent,
                            onChange: (value) {
                              _con.mobile.value = value;
                              _con.mobileError.value = "";
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            errorMessage: _con.mobileError,
                          ),
                          AppTextField(
                            prefixIcon: ImageConstant.password,
                            hintText: "password".tr,
                            border: true,
                            color: Colors.transparent,
                            obsecureText: true,
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
                          hSizedBox10,
                          // Container(
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: 20,
                          //   ),
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //     border:
                          //         Border.all(color: AppColors.appColor),
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          //   child: DropdownButton<BranchModel>(
                          //     underline: Container(
                          //       height: 0,
                          //     ),
                          //     isExpanded: true,
                          //     value: _con.branch.value,
                          //     hint: Text(
                          //       "selectyourbranch".tr,
                          //       style: TextStyle(
                          //         color: AppColors.appColor,
                          //       ),
                          //     ),
                          //     style: const TextStyle(
                          //       color: Colors.black,
                          //     ),
                          //     onChanged: (BranchModel? v) {
                          //       _con.branch.value = v;
                          //     },
                          //     items: _con.branches
                          //         .map(
                          //           (e) => DropdownMenuItem(
                          //             value: e,
                          //             child: Text(
                          //               e.title!,
                          //             ),
                          //           ),
                          //         )
                          //         .toList(),
                          //   ),
                          // ),
                          // const SizedBox(height: 10),
                          AppButton(
                            radius: 10,
                            onPressed: () => _con.register(),
                            text: 'register'.tr,
                          ),
                          SizedBox(height: Get.height * 0.03),
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
                                onTap: () => Get.find<LoginScreenController>()
                                    .googlelogin(),
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
                                  onTap: () => Get.find<LoginScreenController>()
                                      .loginWithApple(),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xffDEDEDE))),
                                    child: Image.asset(
                                      ImageConstant.appleIcon,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.04),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 2),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xffB3B3B3),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                " ${"alreadyhaveanaccount".tr}",
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
                      SizedBox(height: Get.height * 0.03),
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
      },
    );
  }

  Widget typeWidget(
    bool istrue,
    String text,
    Function() onPress,
  ) =>
      GestureDetector(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: istrue ? AppColors.appColor : Colors.white,
            border: Border.all(
              color:
                  istrue ? AppColors.appColor : Colors.black.withOpacity(0.3),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: istrue ? Colors.white : Colors.black.withOpacity(0.3),
            ),
          ),
        ),
      );
}
