import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  static Color appColor = fromHex('#13A97B');
  static Color primaryColor = fromHex('#FFC42B');
  static Color secondaryColor = fromHex('#F8F8F8');
  static Color appIconColor = fromHex('#797F7E');
  static Color backgroundColor = fromHex('#F8F8F8');
  static Color bottomBarColor = fromHex('#EDEDED');
  static Color borderColor = fromHex('#AFADAD');
  static Color textGreyColor = fromHex('#7D7D7D');
  static Color appTextFeildColor = fromHex('#EBF0F3');
  static Color textBlackColor = fromHex('#0D1724');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
