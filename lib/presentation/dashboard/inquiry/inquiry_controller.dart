import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traval/core/app_export.dart';
import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/repo/profile/profile_repo.dart';

class InquiryController extends GetxController {
  RxString nameError = "".obs;
  RxString name = "".obs;

  RxString emailError = "".obs;
  RxString email = "".obs;

  RxString messageError = "".obs;
  RxString message = "".obs;

  bool validate() {
    RxBool isValid = true.obs;
    emailError.value = '';
    nameError.value = '';

    if (email.value.isEmpty) {
      emailError.value = 'enteremail'.tr;
      isValid.value = false;
    }
    if (name.value.isEmpty) {
      nameError.value = 'entername'.tr;
      isValid.value = false;
    }

    if (message.value.isEmpty) {
      messageError.value = 'entermessage'.tr;
      isValid.value = false;
    }

    return isValid.value;
  }

  onvalidate() {
    if (validate()) {
      submitQuery();
    }
  }

  void submitQuery() async {
    LoadingOverlay.of(Get.context!).show();
    http.Response? res = await ProfileRepo.submitQuery(
      email: email.value,
      name: name.value,
      message: message.value,
    );
    LoadingOverlay.of(Get.context!).hide();
    if (res != null) {
      var decoded = json.decode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        toast("yourmessagesentsuccessfully".tr);
        Get.back();
      } else if ([409, 403, 401, 400].contains(res.statusCode)) {
        toast(decoded['message']);
      } else if (res.statusCode == 422) {
        if (decoded['data'].containsKey("email")) {
          emailError.value = decoded['data']['email'].first;
        }
        if (decoded['data'].containsKey("name")) {
          nameError.value = decoded['data']['name'].first;
        }
        if (decoded['data'].containsKey("message")) {
          message.value = decoded['data']['message'].first;
        }
      } else if (res.statusCode == 500) {
        toast(AppConfig.api500Error);
      }
    } else {
      toast(AppConfig.apiError);
    }
  }
}
