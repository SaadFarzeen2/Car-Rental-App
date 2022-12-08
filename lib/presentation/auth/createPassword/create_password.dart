import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/auth/createPassword/create_password_controller.dart';
import 'package:traval/presentation/comman_widget/app_bar.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';

class CreatePassword extends StatelessWidget {
  CreatePassword({super.key});
  final CreatePasswordController _con = Get.put(CreatePasswordController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
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
                  'createpassword'.tr,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.appColor),
                ),
                hSizedBox14,
                Obx(
                  () => AppTextField(
                    hintText: "newpassword".tr,
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
                    _con.onCreatePassword();
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
