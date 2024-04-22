import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF303030);

final themeLight = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: _primaryColor),
  primaryColor: _primaryColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: _primaryColor,
    unselectedItemColor: _primaryColor,
  ),
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(_primaryColor),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: _primaryColor,
    foregroundColor: Colors.white,
  ),
);
