import 'package:traval/presentation/auth/changePassword/change_password_controller.dart';
import 'package:traval/presentation/comman_widget/app_bar.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_export.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final ChangePasswordScreenController _con =
      Get.put(ChangePasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        backgroundColor:
            Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
        appBar: appBar(text: ''),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    ImageConstant.logoIcon,
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                Text(
                  'changepassword'.tr,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.appColor),
                ),
                hSizedBox14,
                Obx(
                  () => AppTextField(
                    hintText: "entertheoldpassword".tr,
                    obsecureText: _con.obsure.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _con.obsure.toggle();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: SvgPicture.asset(
                          _con.obsure.value == true
                              ? ImageConstant.eyeshow
                              : ImageConstant.eyeshow,
                          height: 20,
                          width: 20,
                          color: _con.obsure.value == true
                              ? AppColors.appColor
                              : const Color(0xffD7D7D7),
                        ),
                      ),
                    ),
                    border: true,
                    color: Colors.transparent,
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
                ),
                hSizedBox10,
                Obx(
                  () => AppTextField(
                    hintText: "enterthenewpassword".tr,
                    border: true,
                    color: Colors.transparent,
                    obsecureText: _con.obsure.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _con.obsure.toggle();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: SvgPicture.asset(
                          _con.obsure.value == true
                              ? ImageConstant.eyeshow
                              : ImageConstant.eyeshow,
                          height: 20,
                          width: 20,
                          color: _con.obsure.value == true
                              ? AppColors.appColor
                              : const Color(0xffD7D7D7),
                        ),
                      ),
                    ),
                    initialValue: _con.confirmPassword.value,
                    onChange: (value) {
                      _con.confirmPassword.value = value;
                      _con.confirmPasswordError.value = '';
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp("[a-zA-Z0-9@_.-]"),
                      ),
                    ],
                    errorMessage: _con.confirmPasswordError,
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                AppButton(
                  radius: 10,
                  onPressed: () {
                    _con.onChangePassword();
                  },
                  text: 'save'.tr,
                ),
                hSizedBox10,
              ],
            ),
          ),
        ),
      );
    });
  }
}
