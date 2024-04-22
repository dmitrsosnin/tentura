import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF303030);

final themeDark = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: _primaryColor),
);
