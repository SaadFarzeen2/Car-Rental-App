import 'package:flutter/material.dart';

import '../../core/app_export.dart';

appBar({
  Function()? onPressed,
  Function()? onTap,
  Function()? actionOnTap,
  String? text,
  final Color? backgroundColor,
  final Color? iconColor,
  final Color? textColor,
  bool? centerTitle = false,
}) =>
   AppBar(
          backgroundColor: backgroundColor ?? (Colors.white),
          // key: _scaffoldKey,
          leadingWidth: 70,
          centerTitle: centerTitle,
          elevation: 5,
          shadowColor: const Color(0xffEBEBEB).withOpacity(0.5),
         iconTheme: const IconThemeData(color: Colors.black),
          title: Text(text!),
          titleTextStyle: TextStyle(
            fontSize: 18,
            color:
                textColor ?? (Get.isDarkMode ? Colors.white54 : Colors.black),
            fontWeight: FontWeight.w600,
          ),

    );
