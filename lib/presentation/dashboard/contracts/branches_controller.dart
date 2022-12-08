import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:traval/core/app_export.dart';
import 'package:traval/models/vehicle_model.dart';
import 'package:traval/repo/dashboard/dashboard_repo.dart';
import 'package:intl/intl.dart';

class BranchesController extends GetxController {
  RxList<BranchModel> branches = <BranchModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getBranches();
    super.onInit();
  }

  Future getBranches() async {
    RxList<BranchModel> bList = <BranchModel>[].obs;
    isLoading = true.obs;
    http.Response? response = await DashboardRepo.getBranchList();
    isLoading.value = false;
    if (response!.statusCode == 200 || response.statusCode == 201) {
      var decoded = json.decode(response.body);
      // log(response.body.toString());
      if (decoded["data"]["data"] != null) {
        for (var i = 0; i < decoded["data"]["data"].length; i++) {
          BranchModel branch = BranchModel.fromMap(decoded["data"]["data"][i]);
          bList.add(branch);
        }
        branches += bList;
      }
    } else {
      isLoading.value = false;
    }
  }

  String timeString({required String? time}) {
    if (time != null) {
      var dateTime = DateFormat("hh:mm:ss").parse(time, true);
      var t = DateFormat().add_jm().format(dateTime);
      return t;
    } else {
      return "--:--";
    }
  }
}
