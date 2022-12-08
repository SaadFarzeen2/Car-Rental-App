import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class MyContractScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isloading = true.obs;
  RxInt currentIndex = 0.obs;
  TabController? tabController;
  List tabList = [
    'all'.tr,
    'active'.tr,
    'underclaim'.tr,
    'closed'.tr,
  ];
  @override
  void onInit() {
    tabController = TabController(initialIndex: 0, vsync: this, length: 4);

    tabController!.addListener(_handleTabSelection);
    isloading.value = false;
    super.onInit();
  }

  _handleTabSelection() {
    if (tabController!.indexIsChanging) {
      currentIndex.value = tabController!.index;
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }
}
