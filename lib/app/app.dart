import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({
    this.di = const DI(),
    super.key,
  });

  final DI di;

  Future<App> _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await di.init();
    return this;
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: _init(),
      builder: (context, snapshot) {
        return snapshot.data == null
            ? MaterialApp(
                title: 'Tentura',
                color: const Color(0x00B77EFF),
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(useMaterial3: true),
                darkTheme: ThemeData.dark(useMaterial3: true),
                home: const Center(child: CircularProgressIndicator.adaptive()),
              )
            : MaterialApp.router(
                title: 'Tentura',
                routerConfig: router,
                color: const Color(0x00B77EFF),
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(useMaterial3: true),
                darkTheme: ThemeData.dark(useMaterial3: true),
              );
      });
}
