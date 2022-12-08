import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/presentation/dashboard/profileScreen/profile_controller.dart';
import 'package:traval/repo/profile/profile_repo.dart';
import 'package:http/http.dart' as http;
import '../../../core/app_export.dart';

class AddEditProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;

  // RxString firstName = "".obs;
  // RxString firstNameError = "".obs;
  // RxString lastName = "".obs;
  // RxString lastNameError = "".obs;
  RxString mobile = "".obs;
  RxString mobileError = "".obs;
  RxString email = "".obs;
  RxString emailError = "".obs;
  RxString address = "".obs;
  RxString addressError = "".obs;
  RxString fullName = "".obs;
  RxString fullNameError = "".obs;
  // RxString lastName = "".obs;
  // RxString lastNameError = "".obs;
  RxString idNumber = "".obs;
  RxString idNumberError = "".obs;
  TextEditingController dobController = TextEditingController(text: "");
  DateTime? dob;
  RxString userType = "Cooperation Council/Visitor".obs;

  bool validation() {
    RxBool isValid = true.obs;
    fullNameError.value = "";
    emailError.value = '';
    idNumberError.value = "";
    addressError.value = "";
    mobileError.value = '';

    if (fullName.isEmpty ||
        !RegExp(r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)")
            .hasMatch(fullName.value)) {
      fullNameError.value = "entervalidfullname".tr;
      isValid.value = false;
    }
    if (email.isEmpty) {
      emailError.value = "entervalidemailaddresss".tr;
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "entervalidemailaddresss".tr;
      isValid.value = false;
    }
    if (mobile.isEmpty) {
      mobileError.value = "pleaseentervalidphoneno".tr;
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(mobile.value)) {
      mobileError.value = "pleaseentervalidphoneno".tr;
      isValid.value = false;
    }
    if (idNumber.isEmpty) {
      idNumberError.value = "entervalididentificationnumber".tr;
      isValid.value = false;
    }
    if (dobController.text.isEmpty) {
      toast("selectvaliddob".tr);
      isValid.value = false;
    }
    if (address.isEmpty) {
      addressError.value = "pleaseentervalidaddress".tr;
      isValid.value = false;
    }
    return isValid.value;
  }

  onEditProfileScreen() {
    if (validation()) {
      editProfile();
    }
  }

  getProfileApi() async {
    isLoading = true.obs;
    http.Response? response = await ProfileRepo.getProfileDetails();
    isLoading.value = false;
    if (response!.statusCode == 200 || response.statusCode == 201) {
      var decoded = json.decode(response.body);
      log(decoded.toString());
      fullName.value =
          "${decoded['data']['first_name'] ?? ""} ${decoded['data']['last_name'] ?? ""}";
      email.value = decoded['data']['email'] ?? "";
      address.value = decoded['data']['address'] ?? "";
      mobile.value = decoded['data']['phone_number'].toString();
      dobController.text = decoded['data']['dob'] ?? "0000-00-00";
      idNumber.value = decoded['data']['identification_number'] ?? "";
      userType.value =
          decoded['data']['user_type'] ?? "Cooperation Council/Visitor";
    }
  }

  @override
  void onInit() {
    getProfileApi();
    super.onInit();
  }

  void editProfile() async {
    String lastName = "";
    String firstName = "";
    int firstSpace = fullName.value.indexOf(" ");
    firstName = fullName.value.substring(0, firstSpace);
    lastName = fullName.value.substring(firstSpace).trim();
    LoadingOverlay.of(Get.context!).show();
    http.Response? res = await ProfileRepo.editProfileRepo(
      email: email.value,
      address: address.value,
      firstName: firstName,
      lastName: lastName,
      mobile: mobile.value,
      dob: dobController.text,
      idNumber: idNumber.value,
      userType: userType.value,
    );
    LoadingOverlay.of(Get.context!).hide();
    if (res != null) {
      var decoded = json.decode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        Get.find<ProfileController>().getProfileApi();
        Get.back();
      } else if ([409, 403, 401, 400].contains(res.statusCode)) {
        toast(decoded['message']);
      } else if (res.statusCode == 422) {
        if (decoded['data'].containsKey("email")) {
          emailError.value = decoded['data']['email'].first;
        }
        if (decoded['data'].containsKey("first_name")) {
          fullNameError.value = decoded['data']['first_name'].first;
        }
        if (decoded['data'].containsKey("last_name")) {
          fullNameError.value = decoded['data']['last_name'].first;
        }
        if (decoded['data'].containsKey("phone_number")) {
          mobileError.value = decoded['data']['phone_number'].first;
        }
        if (decoded['data'].containsKey("address")) {
          addressError.value = decoded['data']['address'].first;
        }
      } else if (res.statusCode == 500) {
        toast(AppConfig.api500Error);
      }
    } else {
      toast(AppConfig.apiError);
    }
  }
}
