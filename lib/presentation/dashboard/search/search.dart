import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/dashboard/search/search_con.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final SearchController con = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "findabranch".tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    ImageConstant.map,
                    height: Get.height * 0.5,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xffEDEDED),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 45,
                            decoration: BoxDecoration(
                                color: const Color(0xffEDEDED),
                                borderRadius: BorderRadius.circular(12)),
                            child: DropdownButton<Map>(
                              underline: Container(
                                height: 0,
                              ),
                              iconSize: 0,
                              hint: Text(
                                "findabranch".tr,
                                style: TextStyle(
                                  color: AppColors.appColor,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              onChanged: (Map? v) {
                                con.title.value = v!['title'];
                                con.city.value = v['city'];
                                con.phone.value = v['phone'];
                              },
                              items: con.data
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e['title'],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        // Expanded(
                        // child: TextFormField(
                        //   decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       hintText: "findabranch".tr,
                        //       hintStyle: TextStyle(
                        //         color: AppColors.appColor,
                        //       )),
                        // ),
                        // ),
                        const SizedBox(width: 10),
                        Image.asset(
                          ImageConstant.search,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              rowWidget(
                image: ImageConstant.pinFill,
                subTitle: con.city.value,
                title: con.title.value,
              ),
              const SizedBox(height: 10),
              rowWidget(
                image: ImageConstant.calendarFill,
                subTitle: "fromsaturdaytothursdayfromamtopm".tr,
                title: "workdays".tr,
              ),
              const SizedBox(height: 10),
              rowWidget(
                image: ImageConstant.callFill,
                title: "mobilenumber".tr,
                subTitle: con.phone.value,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppButton(
                  onPressed: () => Get.back(),
                  text: "search".tr,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowWidget({
    required String title,
    required String subTitle,
    required String image,
  }) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.appColor),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Image.asset(
              image,
              height: 24,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xff000000).withOpacity(0.3),
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      color: Color(0xff707070),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      );
}
