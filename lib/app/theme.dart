import 'package:flutter/material.dart';

const primaryColor = Color(0xFF303030);

final themeLight = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor).copyWith(
    onPrimary: Colors.white,
  ),
  primaryColor: primaryColor,
  primaryColorLight: primaryColor,
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(primaryColor)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
  ),
);
