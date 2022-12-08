import 'package:traval/presentation/dashboard/change_language/change_language_controller.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../localization/localization_service.dart';
import '../../comman_widget/app_bar.dart';

class LanguageListScreen extends StatelessWidget {
  final LanguageController _con = Get.put(LanguageController());

  LanguageListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: 'languages'.tr),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: Get.height,
        decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.black : AppColors.backgroundColor),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                "selectyourpreferredlanguage".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 40),
              ...LocalizationService.langs.map((Map lan) {
                return Column(
                  children: [
                    tileWidget(
                      onTap: () {
                        _con.locale.value = lan['code'];
                      },
                      title: lan['lang'],
                      code: lan['code'],
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }).toList(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.updateLocale(Locale("${_con.locale}"));
                },
                child: Container(
                  height: Get.height * 0.06,
                  width: Get.width * 0.60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColors.appColor,
                  ),
                  child: Center(
                    child: Text(
                      "confirmlanguage".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * 0.020,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget tileWidget({
    Function()? onTap,
    String? title,
    String? code,
  }) =>
      Obx(
        () => GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: code == _con.locale.value
                    ? AppColors.appColor
                    : const Color(0xffD4D4D4),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    color: code == _con.locale.value
                        ? AppColors.appColor
                        : Colors.black,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: code == _con.locale.value
                        ? AppColors.appColor
                        : AppColors.appColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: code == _con.locale.value
                      ? const Center(
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 10,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      );
}
