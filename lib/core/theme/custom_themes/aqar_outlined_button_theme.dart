import 'package:flutter/material.dart';
import 'package:aqar/core/constants/aqar_colors.dart';

class AqarOutlinedButtonTheme {
  AqarOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AqarColors.blue,
      side: BorderSide(color: AqarColors.blue),
      textStyle: TextStyle(
          fontSize: 16, color: AqarColors.white, fontWeight: FontWeight.w600),
      padding: EdgeInsetsDirectional.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(14)),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AqarColors.white,
      side: BorderSide(color: AqarColors.blue),
      textStyle: TextStyle(
          fontSize: 16, color: AqarColors.white, fontWeight: FontWeight.w600),
      padding: EdgeInsetsDirectional.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(14)),
    ),
  );
}
