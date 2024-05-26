import 'package:flutter/material.dart';

import 'package:tentura/ui/widget/error_center_text.dart';

import 'package:tentura/features/geo/ui/cubit/geo_cubit.dart';
import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';
import 'package:tentura/features/favorites/ui/bloc/favorites_cubit.dart';

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
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: di.init(),
      builder: (context, snapshot) {
        return snapshot.hasError
            ? Directionality(
                textDirection: TextDirection.ltr,
                child: ErrorCenterText(error: snapshot.error.toString()),
              )
            : snapshot.hasData
                ? MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => GeoCubit(),
                        lazy: false,
                      ),
                      BlocProvider(
                        create: (context) => AuthCubit(),
                        lazy: false,
                      ),
                    ],
                    child: MaterialApp.router(
                      title: 'Tentura',
                      routerConfig: router,
                      color: const Color(0x00B77EFF),
                      debugShowCheckedModeBanner: false,
                      darkTheme: themeDark,
                      theme: themeLight,
                      builder: (context, child) {
                        final currentAccount =
                            context.select<AuthCubit, String>(
                                (s) => s.state.currentAccount);
                        return MultiBlocProvider(
                          key: ValueKey(currentAccount),
                          providers: [
                            BlocProvider(
                              create: (context) => ProfileCubit(
                                id: currentAccount,
                              ),
                            ),
                            BlocProvider(
                              create: (context) => BeaconCubit(
                                id: currentAccount,
                              ),
                            ),
                            BlocProvider(
                              create: (context) => FavoritesCubit(
                                id: currentAccount,
                              ),
                            ),
                          ],
                          child: child!,
                        );
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
      },
    );
  }
}
