import 'package:flutter/material.dart';

import 'package:gravity/core/ui/theme.dart';

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
