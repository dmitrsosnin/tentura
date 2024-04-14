import 'package:flutter/material.dart';

import 'di.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({
    this.di = const DI(),
    super.key,
  });

  final DI di;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: di.init(),
        builder: (context, snapshot) => snapshot.hasData
            ? MaterialApp.router(
                title: 'Tentura',
                routerConfig: router,
                color: const Color(0x00B77EFF),
                debugShowCheckedModeBanner: false,
                darkTheme: ThemeData.dark(),
                theme: ThemeData.light(),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
      );
}
