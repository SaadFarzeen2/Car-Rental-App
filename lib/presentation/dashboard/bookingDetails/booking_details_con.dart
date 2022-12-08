import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:traval/core/app_export.dart';
import 'package:traval/models/vehicle_model.dart';
import 'package:traval/repo/dashboard/dashboard_repo.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class BoookingDetailsController extends GetxController {
  RxBool isLoading = false.obs;
  CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  VehicleDetailModel? vehicle;
  RxString driverName = "".obs;
  RxString driverNumber = "".obs;
  RxString driverEmail = "".obs;

  getBookingDetails({id}) async {
    isLoading = true.obs;
    http.Response? response =
        await DashboardRepo.getSingleBooking(bookingId: id);
    isLoading.value = false;
    if (response!.statusCode == 200 || response.statusCode == 201) {
      var decoded = json.decode(response.body);
      if (decoded['data'].first['driver'] != null) {
        driverName.value = decoded['data'].first['driver']['full_name'];
        driverNumber.value =
            decoded['data'].first['driver']['phone_number'].toString();
        driverEmail.value = decoded['data'].first['driver']['email'];
      }
      log(decoded.toString());
    }
  }

  @override
  void onInit() {
    getBookingDetails(id: Get.arguments.id);
    vehicle = Get.arguments.vehicle;
    super.onInit();
  }

  launchURL({lat, long}) async {
    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";

    if (await canLaunchUrl(Uri.parse(googleMapslocationUrl))) {
      await launchUrl(Uri.parse(googleMapslocationUrl));
    } else {
      throw 'Could not launch $googleMapslocationUrl';
    }
  }
}
