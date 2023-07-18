import 'package:flutter/material.dart';

const primaryColor = Color(0xFF303030);

final themeLight = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  primaryColor: primaryColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    unselectedItemColor: primaryColor,
  ),
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(primaryColor)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
  ),
);
