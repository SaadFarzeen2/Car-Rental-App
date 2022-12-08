import 'dart:convert';

import 'package:traval/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:traval/repo/profile/profile_repo.dart';

class ProfileController extends GetxController {
  RxBool isExpanded = false.obs;
  RxBool isLoading = false.obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString mobile = "".obs;
  RxString email = "".obs;
  RxString address = "".obs;

  @override
  void onInit() {
    getProfileApi();
    super.onInit();
  }

  getProfileApi() async {
    isLoading = true.obs;
    http.Response? response = await ProfileRepo.getProfileDetails();
    isLoading.value = false;
    if (response!.statusCode == 200 || response.statusCode == 201) {
      var decoded = json.decode(response.body);
      firstName.value = decoded['data']['first_name'] ?? "";
      lastName.value = decoded['data']['last_name'] ?? "";
      email.value = decoded['data']['email'] ?? "";
      address.value = decoded['data']['address'] ?? "";
      mobile.value = decoded['data']['phone_number'].toString();
    }
  }
}
