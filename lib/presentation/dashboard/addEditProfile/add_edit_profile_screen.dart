import 'package:flutter/services.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/presentation/comman_widget/app_bar.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';
import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:traval/presentation/dashboard/addEditProfile/add_edit_profile_controller.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class AddEditProfileScreen extends StatelessWidget {
  AddEditProfileScreen({Key? key}) : super(key: key);
  final AddEditProfileScreenController _con =
      Get.put(AddEditProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        text: 'editProfile'.tr,
      ),
      body: Obx(
        () => _con.isLoading.value
            ? const AppLoader()
            : SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Get.height * 0.1),
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
                                () => _con.userType.value = "Saudi / resident",
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextField(
                        errorMessage: _con.fullNameError,
                        prefixIcon: ImageConstant.accountIcon,
                        hintText: "fullname".tr,
                        initialValue: _con.fullName.value,
                        onChange: (e) {
                          _con.fullName.value = e;
                          _con.fullNameError.value = "";
                        },
                      ),
                      // AppTextField(
                      //   errorMessage: _con.lastNameError,
                      //   prefixIcon: ImageConstant.accountIcon,
                      //   hintText: "lastname".tr,
                      //   initialValue: _con.lastName.value,
                      //   onChange: (e) {
                      //     _con.lastName.value = e;
                      //     _con.lastNameError.value = "";
                      //   },
                      // ),
                      AppTextField(
                        errorMessage: _con.emailError,
                        prefixIcon: ImageConstant.mailIcon,
                        hintText: "emailAddress".tr,
                        initialValue: _con.email.value,
                        onChange: (e) {
                          _con.email.value = e;
                          _con.emailError.value = "";
                        },
                      ),
                      AppTextField(
                        hintText: "identificationnumber".tr,
                        obsecureText: false,
                        prefixIcon: ImageConstant.userName,
                        border: true,
                        color: Colors.transparent,
                        initialValue: _con.idNumber.value,
                        onChange: (value) {
                          _con.idNumber.value = value;
                          _con.idNumberError.value = "";
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[0-9a-zA-Z]"),
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
                        errorMessage: _con.mobileError,
                        prefixIcon: ImageConstant.callIcon,
                        hintText: "phoneNo".tr,
                        initialValue: _con.mobile.value,
                        onChange: (e) {
                          _con.mobile.value = e;
                          _con.mobileError.value = "";
                        },
                      ),
                      AppTextField(
                        errorMessage: _con.addressError,
                        prefixIcon: ImageConstant.userName,
                        hintText: "address".tr,
                        initialValue: _con.address.value,
                        onChange: (e) {
                          _con.address.value = e;
                          _con.addressError.value = "";
                        },
                      ),
                      SizedBox(
                        height: Get.height * 0.08,
                      ),
                      AppButton(
                        onPressed: () => _con.onEditProfileScreen(),
                        text: "save".tr,
                      ),
                    ],
                  ),
                ),
              ),
      ),
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
