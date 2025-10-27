import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/theme/custom_themes/aqar_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeDark = ThemeData(
  scaffoldBackgroundColor: AqarColors.black,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AqarColors.primary,
    error: AqarColors.red,
    onPrimary: AqarColors.white,
    onSecondary: AqarColors.white,
    onSurface: AqarColors.white,
    onError: AqarColors.white,
    surface: AqarColors.black,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AqarColors.black,
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
    elevation: 0.0,
    titleTextStyle: GoogleFonts.poppins(
      color: AqarColors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),
    actionsIconTheme: IconThemeData(
      color: AqarColors.white,
      size: 26.sp,
    ),
    toolbarTextStyle: GoogleFonts.poppins(
      color: AqarColors.white,
      fontSize: 14.sp,
    ),
    iconTheme: IconThemeData(
      color: AqarColors.white,
    ),
  ),

  iconTheme: IconThemeData(
    color: AqarColors.primary,
  ),

  textTheme: AqarTextTheme.darkTextTheme,

  primaryColor: AqarColors.primary,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AqarColors.green,
      foregroundColor: AqarColors.white,
      textStyle: GoogleFonts.poppins(
        fontSize: 16.sp,
        color: AqarColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      elevation: 1,
      padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 24.r),
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
    contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 14.r),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AqarColors.grey.withValues(alpha: .3)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AqarColors.grey.withValues(alpha: .3)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AqarColors.primary, width: 1.5.w),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AqarColors.red),
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
    elevation: 2.sp,
    shadowColor: Colors.black.withValues(alpha: .3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
  ),

  // Divider
  dividerTheme: DividerThemeData(
    color: AqarColors.grey.withValues(alpha: .2),
    thickness: 1.w,
  ),

  // Bottom Navigation Bar
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AqarColors.black,
    selectedItemColor: AqarColors.primary,
    unselectedItemColor: AqarColors.grey,
    selectedLabelStyle: GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
  ),
);
