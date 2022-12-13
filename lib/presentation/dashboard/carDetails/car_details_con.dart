import 'dart:convert';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:traval/core/app_export.dart';
import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/helper.dart';
import 'package:traval/models/vehicle_model.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';
import 'package:traval/presentation/dashboard/Payment/Payment_Screen.dart';
import 'package:traval/presentation/dashboard/Payment/payment_type.dart';
import 'package:traval/presentation/dashboard/bookingDetails/booking_details.dart';
import 'package:traval/presentation/dashboard/contracts/branches_controller.dart';
import 'package:traval/presentation/dashboard/dashboard.dart';
import 'package:traval/presentation/dashboard/myReservations/reservations_controller.dart';
import 'package:traval/presentation/dashboard/myReservations/reservations_screen.dart';
import 'package:traval/repo/dashboard/dashboard_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CarDetailsController extends GetxController {
  RxBool carLoading = false.obs;
  RxInt currentIndex = 0.obs;
  final BranchesController con2 = Get.put(BranchesController());
  VehicleDetailModel? vehicle;
  bool data_load = false;

  @override
  void onInit() {
    getCarDetail(Get.arguments);
    super.onInit();
  }

  String dropdownValue = "One";

  CarouselController carouselController = CarouselController();

  getCarDetail(int id) async {
    carLoading.value = true;
    http.Response? response = await DashboardRepo.vehicleDetailAPI(id: id);
    carLoading.value = false;
    if (response!.statusCode == 200 || response.statusCode == 201) {
      var decoded = json.decode(response.body);
      vehicle = VehicleDetailModel.fromMap(decoded["data"]);
    }
  }

  TextEditingController deliveryDate = TextEditingController(text: "");
  DateTime? deliveryDateTime;
  RxString deliveryLocation = "".obs;
  RxString deliveryLocationError = "".obs;
  RxBool withDriver = false.obs;
  TextEditingController receiveDate = TextEditingController(text: "");
  DateTime? receiveDateTime;
  RxString receiveLocation = "".obs;
  RxString receiveLocationError = "".obs;

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
          : DateFormat('yyyy-MM-dd').parse(d.text),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (pickDate != null) {
      String date = DateFormat('yyyy-MM-dd').format(pickDate);
      d.text = date.toString();
      dateTime = pickDate;
    }
  }

  void openBottomSheet(BuildContext context) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              hSizedBox20,
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.green)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: Row(
                    children: [
                      Container(
                          height: 60,
                          width: 30,
                          child: Icon(
                            Icons.pin_drop,
                            size: 32,
                            color: Color.fromARGB(255, 87, 174, 91),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: DropdownButton(
                            hint: deliveryLocation.value == ""
                                ? Text("deliverylocation".tr,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: "roboto",
                                        color: Color.fromARGB(255, 65, 64, 64)))
                                : Text(
                                    deliveryLocation.value,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "roboto",
                                        color: Color.fromARGB(255, 65, 64, 64)),
                                  ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.green),
                            items: con2.isLoading.value
                                ? ['No Branch Found'].map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      );
                                    },
                                  ).toList()
                                : con2.branches.map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val.title,
                                        child: Text(val.title!),
                                      );
                                    },
                                  ).toList(),
                            onChanged: (val) {
                              deliveryLocation.value = val.toString();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // AppTextField(
              //   hintText: "deliverylocation".tr,
              //   obsecureText: false,
              //   prefixIcon: ImageConstant.pin,
              //   border: true,
              //   color: Colors.transparent,
              //   onChange: (value) {
              //     deliveryLocation.value = value;
              //     deliveryLocationError.value = "";
              //   },
              //   errorMessage: deliveryLocationError,
              // ),
              hSizedBox8,

              Obx(
                () => Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.green)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      children: [
                        Container(
                            height: 60,
                            width: 30,
                            child: Icon(
                              Icons.pin_drop,
                              size: 32,
                              color: Color.fromARGB(255, 87, 174, 91),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: DropdownButton(
                            hint: receiveLocation.value == ""
                                ? Text("receivinglocation".tr,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: "roboto",
                                        color: Color.fromARGB(255, 65, 64, 64)))
                                : Text(
                                    receiveLocation.value,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: "roboto",
                                        color: Color.fromARGB(255, 65, 64, 64)),
                                  ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.green),
                            items: con2.isLoading.value
                                ? ['No Branch Found'].map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      );
                                    },
                                  ).toList()
                                : con2.branches.map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val.title,
                                        child: Text(val.title!),
                                      );
                                    },
                                  ).toList(),
                            onChanged: (val) {
                              receiveLocation.value = val.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // AppTextField(
              //   // ontap: () {
              //   // DropdownButton<String>(
              //   //   items: <String>['A', 'B', 'C', 'D'].map((String value) {
              //   //     return DropdownMenuItem<String>(
              //   //       value: value,
              //   //       child: Text(value),
              //   //     );
              //   //   }).toList(),
              //   //   onChanged: (_) {},
              //   // );
              //   // },
              //   hintText: "receivinglocation".tr,
              //   obsecureText: false,
              //   prefixIcon: ImageConstant.pin,
              //   border: true,
              //   color: Colors.transparent,
              //   // onChange: (value) {
              //   //   receiveLocation.value = value;
              //   //   receiveLocationError.value = "";
              //   // },
              //   errorMessage: receiveLocationError,
              // ),
              hSizedBox8,
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      hintText: "deliverydate".tr,
                      obsecureText: false,
                      ontap: () => openDatePicker(
                        deliveryDate,
                        deliveryDateTime,
                      ),
                      readonly: true,
                      controller: deliveryDate,
                      prefixIcon: ImageConstant.calendar,
                      border: true,
                      color: Colors.transparent,
                      iconColor: const Color(0xff707070),
                      errorMessage: "".obs,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppTextField(
                      hintText: "receiveddate".tr,
                      obsecureText: false,
                      ontap: () => openDatePicker(
                        receiveDate,
                        receiveDateTime,
                      ),
                      readonly: true,
                      controller: receiveDate,
                      prefixIcon: ImageConstant.calendar,
                      border: true,
                      color: Colors.transparent,
                      iconColor: const Color(0xff707070),
                      errorMessage: "".obs,
                    ),
                  ),
                ],
              ),
              hSizedBox8,
              Row(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () => withDriver.value = !withDriver.value,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.appColor),
                        ),
                        child: Center(
                          child: withDriver.value
                              ? const Icon(Icons.done)
                              : Container(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "carreservation".tr,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff707070),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              AppButton(
                text: "confirmBooking".tr,
                onPressed: () {
                  if (validateBooking()) {
                    // Get.to(Payment_type());

                    createBooking();
                  }
                },
              ),
              hSizedBox20,
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  bool validateBooking() {
    RxBool isValid = true.obs;
    if (deliveryLocation.value.isEmpty) {
      deliveryLocationError.value = "pleaseenterdeliverylocation".tr;
      isValid.value = false;
    }
    if (receiveLocation.value.isEmpty) {
      receiveLocationError.value = "pleaseenterreceivinglocation".tr;
      isValid.value = false;
    }
    if (receiveDate.text.isEmpty) {
      toast("selectReceiveDate".tr);
      isValid.value = false;
    }
    if (deliveryDate.text.isEmpty) {
      toast("selectDeliveryDate".tr);
      isValid.value = false;
    }
    return isValid.value;
  }

  void createBooking() async {
    // Get.back();

    // Get.to(DashboardScreen());
    LoadingOverlay.of(Get.context!).show();
    http.Response? res = await DashboardRepo.createBooking(
      vehicleId: vehicle!.id!.toString(),
      pLocation: deliveryLocation.value,
      rLocation: receiveLocation.value,
      pickupDate: deliveryDate.text,
      receiveDate: receiveDate.text,
      withDriver: withDriver.value ? "yes" : "no",
    );
    LoadingOverlay.of(Get.context!).hide();

    if (res != null) {
      var decoded = json.decode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        toast("bookingsuccessfully".tr);
        Get.find<MyReservationsScreenController>().currentPage.value = 1;
        Get.find<MyReservationsScreenController>().getBookings(true);
        Get.back();
      } else if ([409, 403, 401, 400].contains(res.statusCode)) {
        toast(decoded['message']);
      } else if (res.statusCode == 422) {
        if (decoded['data'].containsKey("receive_location")) {
          receiveLocationError.value =
              decoded['data']['receive_location'].first;
        }
        if (decoded['data'].containsKey("pickup_location")) {
          deliveryLocationError.value =
              decoded['data']['pickup_location'].first;
        }
        if (decoded['data'].containsKey("receive_date")) {
          toast("${decoded['data']['receive_date'].first}");
        }
        if (decoded['data'].containsKey("pickup_date")) {
          toast("${decoded['data']['pickup_date'].first}");
        }
      } else if (res.statusCode == 500) {
        toast(AppConfig.api500Error);
      }
    } else {
      toast(AppConfig.apiError);
    }
    Get.off(() => MyReservationsScreen());
  }
}
