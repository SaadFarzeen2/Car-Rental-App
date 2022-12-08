import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_export.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? prefixIcon;
  final bool? icon;
  final String? keyValue;
  final String? hintText;
  final String? initialValue;
  final String? titleText;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final bool obsecureText;
  final bool border;
  final bool shadow;
  final bool devider;
  final TextInputType keyboardType;
  final int maxLines;
  final Color? color;
  final List<TextInputFormatter>? inputFormatters;
  final RxString errorMessage;
  final bool readonly;
  final Function()? ontap;
  final double? radius;
  final TextInputType? fieldInputType;
  final Color? iconColor;

  const AppTextField({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.icon = true,
    this.keyValue = "1",
    this.hintText,
    this.initialValue,
    this.suffixIcon,
    this.validate,
    this.onChange,
    this.onFieldSubmitted,
    this.obsecureText = false,
    this.border = true,
    this.shadow = false,
    this.devider = true,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.color,
    this.inputFormatters,
    required this.errorMessage,
    this.readonly = false,
    this.ontap,
    this.radius,
    this.titleText,
    this.fieldInputType,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              titleText!,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 10),
            boxShadow: shadow
                ? [
                    BoxShadow(
                        blurRadius: 20.0,
                        spreadRadius: 2.0,
                        color: Colors.grey[200]!),
                  ]
                : [],
          ),
          child: TextFormField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            initialValue: initialValue,
            onFieldSubmitted: onFieldSubmitted,
            style: const TextStyle(
              color: Color(0xff707070),
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            onTap: ontap,
            readOnly: readonly,
            controller: controller,
            onChanged: onChange,
            inputFormatters: inputFormatters,
            cursorColor: AppColors.appColor,
            obscureText: obsecureText,
            maxLines: maxLines,
            decoration: InputDecoration(
              // filled: true,
              contentPadding: const EdgeInsets.symmetric(
                // horizontal: 14.0,
                vertical: 16.0,
              ),

              prefix: prefixIcon != null ? null : wSizedBox20,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(11),
                      child: Image.asset(
                        prefixIcon!,
                        height: 20,
                        width: 20,
                        color: iconColor ?? AppColors.appColor,
                      ),
                    )
                  : null,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xff707070),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              focusedErrorBorder: border == true
                  ? OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.appColor, width: 1),
                      borderRadius: BorderRadius.circular(radius ?? 10),
                    )
                  : InputBorder.none,
              focusedBorder: border == true
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.appColor.withOpacity(.5), width: 2),
                      borderRadius: BorderRadius.circular(radius ?? 10),
                    )
                  : InputBorder.none,
              enabledBorder: border == true
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appColor,
                      ),
                      borderRadius: BorderRadius.circular(radius ?? 10),
                    )
                  : InputBorder.none,
              isDense: false,
            ),
          ),
        ),
        Obx(
          () => (errorMessage.value.isNotEmpty)
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(
                      errorMessage.value,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                      ),
                    ),
                  ),
                )
              : hSizedBox8,
        )
      ],
    );
  }
}
