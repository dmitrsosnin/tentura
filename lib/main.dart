import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/di.dart';

Future<void> main() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  await SentryFlutter.init(
    (options) => options
      ..dsn = const String.fromEnvironment('SENTRY_URL')
      ..tracesSampleRate = 1.0,
    appRunner: () => runApp(const DI()),
  );
}
