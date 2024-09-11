import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/di/di.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) => options
      ..dsn = const String.fromEnvironment('SENTRY_URL')
      ..ignoreErrors = [
        'SocketException',
        'AuthenticationNotFoundException',
      ]
      ..tracesSampleRate = 1.0,
    appRunner: () async {
      FlutterNativeSplash.preserve(
        widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
      );
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await configureDependencies();
      FlutterNativeSplash.remove();
      runApp(const DI());
    },
  );
}
