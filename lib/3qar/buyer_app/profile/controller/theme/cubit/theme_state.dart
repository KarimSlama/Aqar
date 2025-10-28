import 'package:flutter/material.dart';

sealed class ThemeState {
  final ThemeData themeData;
  final bool isDark;

  const ThemeState({
    required this.themeData,
    required this.isDark,
  });
}

class LightThemeState extends ThemeState {
  const LightThemeState(ThemeData themeData)
      : super(
          themeData: themeData,
          isDark: false,
        );
}

class DarkThemeState extends ThemeState {
  const DarkThemeState(ThemeData themeData)
      : super(
          themeData: themeData,
          isDark: true,
        );
}