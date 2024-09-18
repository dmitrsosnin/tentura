import 'package:flutter/material.dart';

const _primaryColorLight = Color(0xFF303030);
const _primaryColorDark = Color(0xFF3A1E5C);

final colorSchemeLight = ColorScheme.fromSeed(
  seedColor: _primaryColorLight,
  primary: Colors.black,
  onPrimary: Colors.white,
  primaryContainer: Colors.white,
  onPrimaryContainer: Colors.black,
  secondary: Colors.black,
  onSecondary: Colors.white,
  secondaryContainer: Colors.white,
  onSecondaryContainer: Colors.black,
  surface: Colors.white,
  surfaceTint: Colors.white,
  onSurface: Colors.black,
);

final colorSchemeDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: _primaryColorDark,
  primary: Colors.white,
  onPrimary: Colors.black,
  primaryContainer: Colors.black,
  onPrimaryContainer: Colors.white,
  secondary: Colors.white,
  onSecondary: Colors.black,
  secondaryContainer: Colors.black,
  onSecondaryContainer: Colors.white,
  surface: Colors.black,
  surfaceTint: Colors.black,
  onSurface: Colors.white,
);

final themeLight = _createAppTheme(Brightness.light);
final themeDark = _createAppTheme(Brightness.dark);

ThemeData _createAppTheme(Brightness brightness) {
  final isDarkMode = brightness == Brightness.dark;
  final colorScheme = isDarkMode ? colorSchemeDark : colorSchemeLight;

  return ThemeData().copyWith(
    brightness: brightness,
    colorScheme: colorScheme,
    canvasColor: colorScheme.surfaceTint,
    scaffoldBackgroundColor: colorScheme.surface,
    unselectedWidgetColor: colorScheme.onSurface,
    // Icon
    iconTheme: IconThemeData(
      color: colorScheme.onSurface,
    ),
    //Text
    textTheme: ThemeData().textTheme.copyWith(
          displaySmall: TextStyle(
            fontFamily: 'Roboto',
            color: colorScheme.onSurface,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          ),
        ),
  );
}
