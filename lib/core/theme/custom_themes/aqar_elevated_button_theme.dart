import 'package:flutter/material.dart';
import 'package:aqar/core/constants/aqar_colors.dart';

class AqarElevatedButtonTheme {
  AqarElevatedButtonTheme._();

  /// Customizable Light Elevated Button

  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AqarColors.white,
      backgroundColor: AqarColors.darkBlue,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(8)),
    ),
  );

  /// Customizable Dark Elevated Button

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AqarColors.white,
      backgroundColor: AqarColors.darkBlue,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(8)),
    ),
  );
}
