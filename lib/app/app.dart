import 'package:flutter/material.dart';

import 'package:tentura/ui/theme_dark.dart';
import 'package:tentura/ui/theme_light.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Tentura',
        routerConfig: router,
        color: const Color(0x00B77EFF),
        debugShowCheckedModeBanner: false,
        darkTheme: themeDark,
        theme: themeLight,
      );
}
