import 'dart:convert';

import 'package:traval/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:traval/repo/dashboard/dashboard_repo.dart';

class AboutUsController extends GetxController {
  RxBool isLoading = false.obs;
  RxString title = "".obs;
  RxString description = "".obs;
  RxString web = "".obs;
  RxString address = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;

  getAboutUs() async {
    isLoading.value = true;
    http.Response? response = await DashboardRepo.getAboutUs();
    isLoading.value = false;
    if (response!.statusCode == 200 || response.statusCode == 201) {
      var decoded = json.decode(response.body);
      if (decoded['data'].runtimeType != List) {
        title.value = decoded['data']['full_name'] ?? "";
        email.value = decoded['data']['email'] ?? "";
        address.value = decoded['data']['address'] ?? "";
        phone.value = decoded['data']['phone_number'].toString();
        web.value = decoded['data']['website'] ?? "";
        description.value = decoded['data']['description'] ?? "";
      }
    }
  }

  @override
  void onInit() {
    getAboutUs();
    super.onInit();
  }
}
