import 'package:flutter/material.dart';


class AppTextStyle {
  static TextStyle poppins(
      {Color fontColor,
      double fontSize,
      FontWeight fontWeight,
      FontStyle fontStyle,
      TextDecoration decoration}) {
    return TextStyle(
        color: fontColor ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 16,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration ?? TextDecoration.none);
  }
}
