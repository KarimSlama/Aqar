import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_themes/aqar_text_theme.dart';

ThemeData themeLight = ThemeData(
  scaffoldBackgroundColor: AqarColors.white,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: AqarColors.primary,
    error: AqarColors.red,
    onPrimary: AqarColors.white,
    onSecondary: AqarColors.white,
    onSurface: AqarColors.black,
    onError: AqarColors.white,
    surface: AqarColors.white,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AqarColors.white,
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
    elevation: 0.0,
    titleTextStyle: GoogleFonts.poppins(
      color: AqarColors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),
    actionsIconTheme: IconThemeData(
      color: AqarColors.black,
      size: 26.sp,
    ),
    toolbarTextStyle: GoogleFonts.poppins(
      color: AqarColors.black,
      fontSize: 14.sp,
    ),
    iconTheme: IconThemeData(
      color: AqarColors.black,
      size: 24.sp,
    ),
  ),

  iconTheme: IconThemeData(
    color: AqarColors.primary,
    size: 24.sp,
  ),
  textTheme: AqarTextTheme.lighTextTheme,
  primaryColor: AqarColors.primary,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AqarColors.green,
      foregroundColor: AqarColors.white,
      textStyle: GoogleFonts.poppins(
        color: AqarColors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: AqarColors.white, width: 1.w),
      textStyle: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AqarColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AqarColors.green,
      textStyle: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),

  // Input Fields
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide:
          BorderSide(color: AqarColors.grey.withValues(alpha: .3), width: 1.w),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide:
          BorderSide(color: AqarColors.grey.withValues(alpha: .3), width: 1.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AqarColors.primary, width: 1.5.w),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AqarColors.red, width: 1.w),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AqarColors.red, width: 1.5.w),
    ),
    labelStyle: GoogleFonts.poppins(
      color: AqarColors.grey,
      fontSize: 14.sp,
    ),
    hintStyle: GoogleFonts.poppins(
      color: AqarColors.grey,
      fontSize: 14.sp,
    ),
  ),

  // Card Theme
  cardTheme: CardThemeData(
    color: AqarColors.white,
    elevation: 2,
    shadowColor: AqarColors.black.withValues(alpha: .1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
  ),

  // Divider
  dividerTheme: DividerThemeData(
    color: AqarColors.grey.withValues(alpha: .2),
    thickness: 1.h,
  ),
);
