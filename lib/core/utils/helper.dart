import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:traval/core/app_export.dart';

class Helper {
  static bool isEmail(String em) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(em);
  }

  static bool isPassword(String em) {
    return RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$').hasMatch(em);
  }

  static bool isPhoneNumber(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em));
  }

  static bool isCardNumber(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em) && em.length == 16);
  }

  static bool iscvv(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em) && em.length == 3);
  }

  static openDOBPicker(TextEditingController d, DateTime? dateTime) async {
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
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    if (pickDate != null) {
      String date = DateFormat('yyyy-MM-dd').format(pickDate);
      d.text = date.toString();
      dateTime = pickDate;
    }
  }
}

toast(message) {
  Fluttertoast.cancel();
  if (message != null) {
    Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
