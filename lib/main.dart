import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  const sentryUrl = String.fromEnvironment('SENTRY_URL');
  if (sentryUrl.isEmpty) {
    // FlutterError.onError = (details) {
    //   FlutterError.presentError(details);
    // };
    // PlatformDispatcher.instance.onError = (error, stack) {
    //   return true;
    // };
    runApp(const App());
  } else {
    await SentryFlutter.init(
      (options) => options
        ..dsn = sentryUrl
        ..tracesSampleRate = 1.0,
      appRunner: () => runApp(const App()),
    );
  }
}
