import 'package:traval/presentation/comman_widget/app_bar.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';
import 'package:traval/presentation/dashboard/reservation/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_export.dart';

class ReservationScreen extends StatelessWidget {
  ReservationScreen({Key? key}) : super(key: key);
  final ReservationScreenController _con =
      Get.put(ReservationScreenController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        backgroundColor:
            Get.isDarkMode ? Colors.black : AppColors.backgroundColor,
        appBar: appBar(text: ''),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      ImageConstant.logoIcon,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.1),
                  Text(
                    'reservationmanagement'.tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.appColor),
                  ),
                  hSizedBox14,
                  AppTextField(
                    hintText: "reservationnumber".tr,
                    border: true,
                    color: Colors.transparent,
                    initialValue: _con.reservationNumber.value,
                    onChange: (value) {
                      _con.reservationNumber.value = value;
                      _con.reservationNumberError.value = '';
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp("[a-zA-Z0-9@_.-]"),
                      ),
                    ],
                    errorMessage: _con.reservationNumberError,
                  ),
                  SizedBox(height: Get.height * 0.1),
                  AppButton(
                    radius: 10,
                    onPressed: () {
                      _con.onReservationNumber();
                    },
                    text: 'followuponbooking'.tr,
                  ),
                  hSizedBox10,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
