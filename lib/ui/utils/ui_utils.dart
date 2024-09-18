import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'package:tentura/consts.dart';

import '../bloc/state_base.dart';

const paddingMediumA = EdgeInsets.all(20);

const paddingMediumH = EdgeInsets.symmetric(horizontal: 20);

const paddingLargeV = EdgeInsets.symmetric(vertical: 32);

const paddingMediumV = EdgeInsets.symmetric(vertical: 20);

const paddingSmallV = EdgeInsets.symmetric(vertical: 8);

final _fYMD = DateFormat.yMd();
String fYMD(DateTime? dateTime) =>
    dateTime == null ? '' : _fYMD.format(dateTime);

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context, {
  String? text,
  List<TextSpan>? textSpans,
  Duration duration = kSnackBarDuration,
  bool isFloating = false,
  bool isError = false,
  Color? color,
}) {
  final theme = Theme.of(context);
  ScaffoldMessenger.of(context).clearSnackBars();
  if (isError) if (kDebugMode) print(text);
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: isFloating ? SnackBarBehavior.floating : null,
    margin: isFloating ? const EdgeInsets.all(16) : null,
    duration: duration,
    backgroundColor: isError
        ? theme.colorScheme.error
        : color ?? theme.snackBarTheme.backgroundColor,
    content: RichText(
      text: TextSpan(
        text: text,
        children: textSpans,
        style: isError
            ? theme.snackBarTheme.contentTextStyle?.copyWith(
                color: theme.colorScheme.onError,
              )
            : theme.snackBarTheme.contentTextStyle,
      ),
    ),
  ));
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarError(
  BuildContext context,
  StateFetchMixin state,
) =>
    showSnackBar(
      context,
      isError: true,
      text: state.error?.toString() ?? 'Unknown error!',
    );

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
