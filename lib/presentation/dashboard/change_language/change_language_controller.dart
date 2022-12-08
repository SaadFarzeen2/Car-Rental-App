import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class LanguageController extends GetxController {
  RxString locale = "en".obs;

  @override
  void onInit() {
    if (Get.locale != const Locale("en")) {
      locale.value = "ar";
    }
    super.onInit();
  }
}
