import 'dart:convert';

import 'package:traval/core/app_export.dart';
import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:traval/core/utils/local_storage.dart';
import 'package:traval/presentation/auth/createPassword/create_password.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/repo/forgetPassword/forget_password_repo.dart';
import 'package:traval/repo/login/login_repo.dart';

class ForgetPasswordController extends GetxController {
  RxString otp = "".obs;
  RxString email = "".obs;
  RxString emailError = "".obs;

  RxBool isOtpField = false.obs;

  bool valid() {
    RxBool isValid = true.obs;

    emailError.value = '';
    if (email.isEmpty) {
      emailError.value = "entervalidemailaddresss".tr;
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "entervalidemailaddresss".tr;
      isValid.value = false;
    }

    return isValid.value;
  }

  forgotPassword() async {
    if (valid()) {
      LoadingOverlay.of(Get.context!).show();
      http.Response? res = await ForgotPasswordRepo.forgotpasswordAPI(
        email: email.value,
      );
      LoadingOverlay.of(Get.context!).hide();
      if (res != null) {
        var decoded = json.decode(res.body);
        if (res.statusCode == 200 || res.statusCode == 201) {
          isOtpField.value = true;
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

  onVerify() async {
    if (otp.value.isNotEmpty) {
      LoadingOverlay.of(Get.context!).show();
      http.Response? res = await LoginRepo.verifyEmail(
        email: email.value,
        otp: otp.value,
      );
      LoadingOverlay.of(Get.context!).hide();
      if (res != null) {
        var decoded = json.decode(res.body);
        if (res.statusCode == 200 || res.statusCode == 201) {
          LocalStorage.storeDataInfo(decoded["data"]);
          Get.to(() => CreatePassword(), arguments: email.value);
        } else if ([409, 403, 401, 400, 422].contains(res.statusCode)) {
          toast(decoded['message']);
        } else if (res.statusCode == 500) {
          toast(decoded['message']);
        }
      } else {
        toast(AppConfig.apiError);
      }
    } else {
      toast("entervalidotp".tr);
    }
  }
}
