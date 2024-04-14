import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  setPathUrlStrategy();
  await SentryFlutter.init(
    (options) => options
      ..dsn = const String.fromEnvironment('SENTRY_URL')
      ..tracesSampleRate = 1.0,
    appRunner: () => runApp(const App()),
  );
}
