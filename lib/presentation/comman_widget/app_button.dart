import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;

  final double? height;
  final double? width;
  final Color? color;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;
  final bool? border;
  final double? fs;
  final double? radius;

  const AppButton({
    Key? key,
    this.onPressed,
    this.text,
    this.height,
    this.width,
    this.color,
    this.border = false,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.fs,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: color ?? AppColors.appColor,
          border: border == true
              ? Border.all(color: borderColor ?? AppColors.appColor)
              : Border.all(color: color ?? AppColors.appColor),
        ),
        child: SizedBox(
          height: height ?? 50,
          width: width,
          child: Center(
            child: Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fs ?? 16,
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
