import 'package:flutter/material.dart';

import 'package:tentura/ui/widget/error_center_text.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

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
            ? Directionality(
                textDirection: TextDirection.ltr,
                child: ErrorCenterText(error: snapshot.error.toString()),
              )
            : snapshot.hasData
                ? MaterialApp.router(
                    title: 'Tentura',
                    routerConfig: router,
                    color: const Color(0x00B77EFF),
                    debugShowCheckedModeBanner: false,
                    darkTheme: themeDark,
                    theme: themeLight,
                    builder: (context, child) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (_) => AuthCubit(),
                          lazy: false,
                        ),
                      ],
                      child: BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) => child!,
                        buildWhen: (p, c) =>
                            p.currentAccount != c.currentAccount,
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
      );
}
