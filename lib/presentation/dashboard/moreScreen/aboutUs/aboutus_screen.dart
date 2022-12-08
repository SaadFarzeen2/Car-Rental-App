import 'package:flutter/material.dart';
import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/comman_widget/app_bar.dart';
import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:traval/presentation/dashboard/moreScreen/aboutUs/aboutus_controller.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});
  final AboutUsController _con = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: appBar(text: 'aboutus'.tr),
      body: Obx(
        () => _con.isLoading.value
            ? const Center(
                child: AppLoader(),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hSizedBox20,
                    Text(
                      "${'companyinformation'.tr} :",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff02190C),
                      ),
                    ),
                    hSizedBox10,
                    contactUsInfo(
                        image: ImageConstant.companyIcon,
                        text: _con.title.value,
                        des: _con.description.value),
                    hSizedBox10,
                    contactUsInfo(
                      image: ImageConstant.webIcon,
                      text: _con.web.value,
                    ),
                    hSizedBox20,
                    Text(
                      "${'contactinformation'.tr} :",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff02190C),
                      ),
                    ),
                    hSizedBox10,
                    contactUsInfo(
                      image: ImageConstant.mailIcon,
                      text: _con.email.value,
                    ),
                    hSizedBox10,
                    contactUsInfo(
                        image: ImageConstant.callIcon, text: _con.phone.value),
                    hSizedBox20,
                    Text(
                      "${'companyAddress'.tr} :",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff02190C),
                      ),
                    ),
                    hSizedBox10,
                    contactUsInfo(
                      image: ImageConstant.pin,
                      text: _con.address.value,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget contactUsInfo({
    required String image,
    required String text,
    String? des,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0.5, 0.6),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 20,
          ),
          wSizedBox16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff393F45).withOpacity(.5),
                  ),
                ),
                if (des != null)
                  Text(
                    "- $des",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
