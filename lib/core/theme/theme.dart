import 'package:aqar/core/app_colors.dart';
import 'package:flutter/material.dart';

import '../constants/aqar_colors.dart';
import 'custom_themes/aqar_appbar_theme.dart';
import 'custom_themes/aqar_bottom_sheet.dart';
import 'custom_themes/aqar_check_box_theme.dart';
import 'custom_themes/aqar_chip_theme.dart';
import 'custom_themes/aqar_elevated_button_theme.dart';
import 'custom_themes/aqar_outlined_button_theme.dart';
import 'custom_themes/aqar_text_field_theme.dart';
import 'custom_themes/aqar_text_theme.dart';

class AqarTheme {
  AqarTheme._();

  static ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      extensions: <ThemeExtension>[
        AppColors(
          primary: AqarColors.blue,
          secondary: AqarColors.blue,
        )
      ],
      scaffoldBackgroundColor: Colors.white,
      textTheme: AqarTextTheme.lighTextTheme,
      chipTheme: AqarChipTheme.lightChipThemeData,
      appBarTheme: AqarAppbarTheme.lightAppbarTheme,
      checkboxTheme: AqarCheckBoxTheme.lightCheckBoxTheme,
      bottomSheetTheme: AqarBottomSheet.lightBottomSheetTheme,
      outlinedButtonTheme: AqarOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: AqarElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: AqarTextFieldTheme.lightInputDecorationTheme);

  static ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      extensions: <ThemeExtension>[
        AppColors(
          primary: AqarColors.blue,
          secondary: AqarColors.blue,
        )
      ],
      scaffoldBackgroundColor: Colors.black,
      textTheme: AqarTextTheme.darkTextTheme,
      chipTheme: AqarChipTheme.darkChipThemeData,
      appBarTheme: AqarAppbarTheme.darkAppbarTheme,
      checkboxTheme: AqarCheckBoxTheme.darkCheckBoxTheme,
      bottomSheetTheme: AqarBottomSheet.darkBottomSheetTheme,
      outlinedButtonTheme: AqarOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: AqarElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: AqarTextFieldTheme.darkInputDecorationTheme);
}
