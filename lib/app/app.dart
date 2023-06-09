import 'package:flutter/material.dart';
import 'package:gravity/core/ui/theme.dart';
import 'package:url_strategy/url_strategy.dart';

import 'di.dart';
import 'router.dart';

class App extends StatelessWidget {
  static Future<App> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    setPathUrlStrategy();
    const di = DI();
    await di.init();
    return const App(di: di);
  }

  const App({super.key, required this.di});

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
