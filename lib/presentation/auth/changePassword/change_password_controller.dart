import 'dart:convert';

import 'package:traval/core/utils/app_config.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/repo/forgetPassword/forget_password_repo.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/helper.dart';
import 'package:http/http.dart' as http;

class ChangePasswordScreenController extends GetxController {
  RxString confirmPassword = "".obs;
  RxString confirmPasswordError = "".obs;

  RxString password = "".obs;
  RxString passwordError = "".obs;

  RxBool obsure = true.obs;
  RxBool checkboxValue = true.obs;

  bool validation() {
    RxBool isValid = true.obs;

    if (password.value.isEmpty) {
      passwordError.value = "enterpassword".tr;
      isValid.value = false;
    }

    if (confirmPassword.value.isEmpty) {
      confirmPasswordError.value = "enterconfirmpassword".tr;
      isValid.value = false;
    }
    return isValid.value;
  }

  onChangePassword() async {
    if (validation()) {
      LoadingOverlay.of(Get.context!).show();
      http.Response? res = await ForgotPasswordRepo.changePassword(
        password: password.value,
        newPassword: confirmPassword.value,
      );
      LoadingOverlay.of(Get.context!).hide();
      if (res != null) {
        var decoded = json.decode(res.body);
        if (res.statusCode == 200 || res.statusCode == 201) {
          toast("Password change successfully");
          Get.back();
        } else if ([409, 403, 401, 400].contains(res.statusCode)) {
          toast(decoded['message']);
        } else if (res.statusCode == 422) {
          if (decoded['data'].containsKey("old_password")) {
            passwordError.value = decoded['data']['old_password'].first;
          }
          if (decoded['data'].containsKey("new_password")) {
            confirmPasswordError.value = decoded['data']['new_password'].first;
          }
          if (decoded['data'].containsKey("confirm_password")) {
            confirmPasswordError.value =
                decoded['data']['confirm_password'].first;
          }
        } else if (res.statusCode == 500) {
          toast(AppConfig.api500Error);
        }
      } else {
        toast(AppConfig.apiError);
      }
    }
  }
}
