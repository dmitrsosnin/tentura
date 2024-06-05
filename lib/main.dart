import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SentryFlutter.init(
    (options) => options
      ..dsn = const String.fromEnvironment('SENTRY_URL')
      ..tracesSampleRate = 1.0,
    appRunner: () async => runApp(await DI(
      storageDirectory: await getApplicationDocumentsDirectory(),
    ).init()),
  );
}
