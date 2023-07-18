import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';

import 'di.dart';
import 'theme.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({
    this.di = const DI(),
    super.key,
  });

  final DI di;

  Future<App> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    setPathUrlStrategy();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return this;
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: di.init(),
        builder: (context, snapshot) => snapshot.hasData
            ? MaterialApp.router(
                title: 'Gravity',
                theme: themeLight,
                routerConfig: router,
                debugShowCheckedModeBanner: false,
              )
            : MaterialApp(
                theme: themeLight,
                home: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
      );
}
