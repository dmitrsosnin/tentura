import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';

final _fYMD = DateFormat.yMd();

String fYMD(DateTime? dateTime) =>
    dateTime == null ? '' : _fYMD.format(dateTime);

sealed class ScreenSize {
  static ScreenSize get(Size size) => switch (size.height) {
        < ScreenSmall.height => const ScreenSmall(),
        < ScreenMedium.height => const ScreenMedium(),
        < ScreenLarge.height => const ScreenLarge(),
        _ => const ScreenBig(),
      };

  const ScreenSize();
}

class ScreenSmall extends ScreenSize {
  static const height = 600;

  const ScreenSmall();
}

class ScreenMedium extends ScreenSize {
  static const height = 800;

  const ScreenMedium();
}

class ScreenLarge extends ScreenSize {
  static const height = 1200;

  const ScreenLarge();
}

class ScreenBig extends ScreenSize {
  static const height = 1600;

  const ScreenBig();
}
