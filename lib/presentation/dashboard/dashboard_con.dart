import 'dart:convert';
import 'package:traval/core/app_export.dart';
import 'package:traval/models/vehicle_model.dart';
import 'package:traval/repo/dashboard/dashboard_repo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  RxBool isDiffAddress = false.obs;

  TextEditingController deliveryDate = TextEditingController(text: "");
  TextEditingController deliveryAddress = TextEditingController(text: "");
  DateTime? deliveryDateTime;

  TextEditingController receiveDate = TextEditingController(text: "");
  DateTime? receiveDateTime;
  TextEditingController receiveAddress = TextEditingController(text: "");

  DateTime receivedDate = DateTime.now();
  RxList<VehicalListModel> vehicalList = <VehicalListModel>[].obs;
  RxInt currentPage = 1.obs;
  RxString search = "".obs;

  RxBool isPaginationLoading = false.obs;
  RxBool nextPageStop = true.obs;
  RxBool isLoading = false.obs;

  ScrollController scrollController = ScrollController();

  void openDatePicker(TextEditingController d, DateTime? dateTime) async {
    final pickDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.appColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
      context: Get.context!,
      locale: Get.locale!,
      initialDate: d.text.isEmpty
          ? DateTime.now()
          : DateFormat('dd-MM-yyyy').parse(d.text),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (pickDate != null) {
      String date = DateFormat('dd-MM-yyyy').format(pickDate);
      d.text = date.toString();
      dateTime = pickDate;
    }
  }

  Future getVehicles(bool isInitial) async {
    RxList<VehicalListModel> vList = <VehicalListModel>[].obs;
    if (isInitial) {
      vehicalList.value = [];
      currentPage.value = 1;
      nextPageStop.value = true;
      isLoading = true.obs;
    }
    if (nextPageStop.isTrue) {
      http.Response? response = await DashboardRepo.vehicalListAPI(
        page: currentPage.value,
        search: search.value,
      );
      isLoading.value = false;
      isPaginationLoading.value = false;
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var decoded = json.decode(response.body);
        if (decoded["data"]["data"] != null) {
          for (var i = 0; i < decoded["data"]["data"].length; i++) {
            VehicalListModel vehicle =
                VehicalListModel.fromMap(decoded["data"]["data"][i]);
            vList.add(vehicle);
          }
          vehicalList += vList;
          currentPage.value++;
          if (vehicalList.length == decoded["data"]["total"]) {
            nextPageStop.value = false;
          }
        }
      }
    } else {
      isPaginationLoading.value = false;
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getVehicles(true);
    manageScrollController();
    super.onInit();
  }

  void manageScrollController() async {
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          if (nextPageStop.isTrue && isPaginationLoading.isFalse) {
            isPaginationLoading.value = true;
            getVehicles(false);
          }
        }
      },
    );
  }
}
