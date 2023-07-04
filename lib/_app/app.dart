import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:gravity/_shared/ui/theme.dart';

import 'di.dart';
import 'router.dart';

class App extends StatelessWidget {
  static Future<App> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    setPathUrlStrategy();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    const di = DI();
    await di.init();
    return const App(di: di);
  }

  const App({
    required this.di,
    super.key,
  });

  final DI di;

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'gravity',
        restorationScopeId: 'app_gravity',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: primaryColor,
          useMaterial3: true,
        ),
        routerConfig: router,
      );
}
