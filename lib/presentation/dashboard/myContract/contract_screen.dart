import 'package:traval/presentation/dashboard/myContract/contract_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/image_constant.dart';
import '../../comman_widget/app_bar.dart';

class MyContractScreen extends StatelessWidget {
  MyContractScreen({Key? key}) : super(key: key);
  final MyContractScreenController _con = Get.put(MyContractScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: appBar(text: ''),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 20),
                child: TabBar(
                    isScrollable: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _con.tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: const Color(0xffA7A7A7),
                    // indicatorSize: TabBarIndicatorSize.label,
                    padding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent),
                    tabs: [
                      ..._con.tabList
                          .asMap()
                          .map((index, value) {
                            return MapEntry(
                              index,
                              Tab(
                                height: 35,
                                child: Container(
                                  constraints: BoxConstraints(
                                    minWidth: Get.width * 0.22,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _con.currentIndex.value == index
                                        ? AppColors.appColor
                                        : const Color(0xffEDEDED),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _con.tabList[index],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                          .values
                          .toList(),
                    ]),
              ),
              Expanded(
                child: TabBarView(
                  controller: _con.tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: Text(
                        'therearenodata'.tr,
                        style: const TextStyle(
                          color: Color(0xffB3B3B3),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.green.withOpacity(0.1),
                    ),
                    Container(
                      color: Colors.red.withOpacity(0.1),
                    ),
                    Container(
                      color: Colors.green.withOpacity(0.1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  renderDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        color: Color(0xffDCDCDC),
        thickness: 1.0,
      ),
    );
  }

  renderMoreView({required String title, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.appColor.withOpacity(0.1),
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    color: Color(0xff707070),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SvgPicture.asset(
              ImageConstant.backIcon,
              height: 18,
              width: 18,
              color: AppColors.appColor,
            ),
          ],
        ),
      ),
    );
  }
}
