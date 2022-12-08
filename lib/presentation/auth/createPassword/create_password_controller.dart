import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:traval/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/repo/forgetPassword/forget_password_repo.dart';

class CreatePasswordController extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;
  RxString passwordError = "".obs;
  RxString confirmPassword = "".obs;
  RxString confirmPasswordError = "".obs;

  @override
  void onInit() {
    email.value = Get.arguments;
    super.onInit();
  }

  bool valid() {
    RxBool isValid = true.obs;

    if (password.value.isEmpty) {
      passwordError.value = "pleaseentervalidpassword".tr;
      isValid.value = false;
    }
    if (confirmPassword.value.isEmpty) {
      confirmPasswordError.value = "pleaseenterconfirmpassword".tr;
      isValid.value = false;
    }
    if (password.value != confirmPassword.value) {
      confirmPasswordError.value = "passworddoesnotmatch".tr;
      isValid.value = false;
    }
    return isValid.value;
  }

  onCreatePassword() async {
    if (valid()) {
      LoadingOverlay.of(Get.context!).show();
      http.Response? res = await ForgotPasswordRepo.createPassword(
        email: email.value,
        password: confirmPassword.value,
      );
      LoadingOverlay.of(Get.context!).hide();
      if (res != null) {
        var decoded = json.decode(res.body);
        if (res.statusCode == 200 || res.statusCode == 201) {
          toast("passwordresetsuccess".tr);
          Get.offAllNamed(AppRoutes.loginScreen);
        } else if ([409, 403, 401, 400, 422].contains(res.statusCode)) {
          toast(decoded['data']["email"][0]);
        } else if (res.statusCode == 500) {
          toast(AppConfig.api500Error);
        }
      } else {
        toast(AppConfig.apiError);
      }
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
