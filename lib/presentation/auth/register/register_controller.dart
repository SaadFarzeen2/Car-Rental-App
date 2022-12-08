import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:traval/core/app_export.dart';
import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/core/utils/local_storage.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/repo/register/register.dart';

class RegisterController extends GetxController {
  RxString fullName = "".obs;
  RxString fullNameError = "".obs;
  // RxString lastName = "".obs;
  // RxString lastNameError = "".obs;
  RxString email = "".obs;
  RxString emailError = "".obs;
  RxString mobile = "".obs;
  RxString mobileError = "".obs;
  RxString idNumber = "".obs;
  RxString idNumberError = "".obs;
  RxString password = "".obs;
  RxString passwordError = "".obs;
  TextEditingController dobController = TextEditingController(text: "");
  DateTime? dob;
  RxString userType = "Cooperation Council/Visitor".obs;
  // Rx<BranchModel?> branch = Rx(null);
  // RxList<BranchModel> branches = <BranchModel>[].obs;
  // RxBool isLoading = false.obs;

  bool valid() {
    RxBool isValid = true.obs;
    fullNameError.value = "";
    emailError.value = '';
    passwordError.value = '';
    idNumberError.value = "";
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
    if (password.isEmpty) {
      passwordError.value = "pleaseentervalidpassword".tr;
      isValid.value = false;
    }
    // if (branch.value == null) {
    //   toast("selectfirstbranch".tr);
    //   isValid.value = false;
    // }
    return isValid.value;
  }

  register() async {
    if (valid()) {
      String lastName = "";
      String firstName = "";
      int firstSpace = fullName.value.indexOf(" ");
      firstName = fullName.value.substring(0, firstSpace);
      lastName = fullName.value.substring(firstSpace).trim();
      LoadingOverlay.of(Get.context!).show();
      http.Response? res = await RegisterRepo.registerAPI(
        email: email.value,
        password: password.value,
        fname: firstName,
        lname: lastName,
        phonenumber: mobile.value,
        // branchId: branch.value!.id.toString(),
        userType: userType.value,
        dob: dobController.text,
        idNumber: idNumber.value,
      );
      LoadingOverlay.of(Get.context!).hide();
      if (res != null) {
        var decoded = json.decode(res.body);
        if (res.statusCode == 200 || res.statusCode == 201) {
          LocalStorage.storeDataInfo(decoded["data"]);
          Get.toNamed(
            AppRoutes.registerVerify,
            arguments: email.value,
          );
        } else if ([409, 403, 401, 400, 422].contains(res.statusCode)) {
          if (decoded['data'].containsKey("first_name")) {
            fullNameError.value = decoded['data']['first_name'].first;
          }
          if (decoded['data'].containsKey("last_name")) {
            fullNameError.value = decoded['data']['last_name'].first;
          }
          if (decoded['data'].containsKey("email")) {
            emailError.value = decoded['data']['email'].first;
          }
          if (decoded['data'].containsKey("phone_number")) {
            mobileError.value = decoded['data']['phone_number'].first;
          }
          if (decoded['data'].containsKey("address")) {
            passwordError.value = decoded['data']['address'].first;
          }
          if (decoded['data'].containsKey("user_type")) {
            toast(decoded['data']['user_type'].first);
          }
          if (decoded['data'].containsKey("dob")) {
            toast(decoded['data']['dob'].first);
          }
          if (decoded['data'].containsKey("identification_number")) {
            idNumberError.value =
                decoded['data']['identification_number'].first;
          }
        } else if (res.statusCode == 500) {
          toast(AppConfig.api500Error);
        }
      } else {
        toast(AppConfig.apiError);
      }
    }
  }

  // Future getBranches() async {
  //   RxList<BranchModel> bList = <BranchModel>[].obs;
  //   isLoading = true.obs;
  //   http.Response? response = await DashboardRepo.getBranchList();
  //   isLoading.value = false;
  //   if (response!.statusCode == 200 || response.statusCode == 201) {
  //     var decoded = json.decode(response.body);
  //     if (decoded["data"]["data"] != null) {
  //       for (var i = 0; i < decoded["data"]["data"].length; i++) {
  //         BranchModel branch = BranchModel.fromMap(decoded["data"]["data"][i]);
  //         bList.add(branch);
  //       }
  //       branches += bList;
  //     }
  //   } else {
  //     isLoading.value = false;
  //   }
  // }
}
