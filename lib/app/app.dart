import 'package:flutter/material.dart';

import 'package:tentura/ui/widget/error_center_text.dart';

import 'di.dart';
import 'router.dart';
import 'theme_dark.dart';
import 'theme_light.dart';

class App extends StatelessWidget {
  const App({
    this.di = const DI(),
    super.key,
  });

  final DI di;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: di.init(),
        builder: (context, snapshot) => snapshot.hasError
            ? ErrorCenterText(error: snapshot.error.toString())
            : snapshot.hasData
                ? MaterialApp.router(
                    title: 'Tentura',
                    routerConfig: router,
                    color: const Color(0x00B77EFF),
                    debugShowCheckedModeBanner: false,
                    darkTheme: themeDark,
                    theme: themeLight,
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
      );
}
