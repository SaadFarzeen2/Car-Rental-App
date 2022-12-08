import 'package:traval/presentation/dashboard/contracts/initial_contract.dart';
import 'package:traval/presentation/dashboard/dashboard.dart';
import 'package:traval/presentation/dashboard/moreScreen/more_screen.dart';
import 'package:traval/presentation/dashboard/myReservations/reservations_screen.dart';
import 'package:traval/presentation/dashboard/profileScreen/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class BottomBarController extends GetxController {
  RxBool isHomeScreen = false.obs;
  RxInt pageIndex = Get.arguments != null && Get.arguments is int
      ? RxInt(Get.arguments)
      : 2.obs;

  List icons = [
    {
      "icon": ImageConstant.profile,
      "title": "arithmetic",
      "active_icon": ImageConstant.profileActive,
    },
    {
      "icon": ImageConstant.reservations,
      "title": "myreservations",
      "active_icon": ImageConstant.reservationsActive,
    },
    {
      "icon": ImageConstant.home,
      "title": "",
      "active_icon": ImageConstant.home,
    },
    {
      "icon": ImageConstant.contracts,
      "title": "branches",
      "active_icon": ImageConstant.contractsActive,
    },
    {
      "icon": ImageConstant.more,
      "title": "more",
      "active_icon": ImageConstant.moreActive,
    },
  ];

  onTap(index) {
    pageIndex.value = index;
  }

  Widget screen() {
    switch (pageIndex.value) {
      case 4:
        return const MoreScreen();
      case 1:
        return MyReservationsScreen();
      case 2:
        return DashboardScreen();
      case 3:
        return InitialContractScreen(
          onButton: () => Get.toNamed(AppRoutes.myContractScreen),
        );
      case 0:
        return ProfileScreen();
      default:
        return DashboardScreen();
    }
  }
}
