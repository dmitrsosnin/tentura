import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/app.dart';

Future<void> main() async {
  const sentryUrl = String.fromEnvironment('SENTRY_URL');
  sentryUrl.isEmpty
      ? runApp(await const App().init())
      : await SentryFlutter.init(
          (options) => options
            ..dsn = sentryUrl
            ..tracesSampleRate = 1.0,
          appRunner: () async => runApp(await const App().init()),
        );
}
