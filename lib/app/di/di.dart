import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/beacon/data/beacon_repository.dart';

import 'package:tentura/features/context/data/context_repository.dart';
import 'package:tentura/features/context/ui/bloc/context_cubit.dart';

import 'package:tentura/features/profile/domain/use_case/profile_case.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';

import 'package:tentura/features/my_field/ui/bloc/my_field_cubit.dart';
import 'package:tentura/features/my_field/data/my_field_repository.dart';

import 'package:tentura/features/favorites/ui/bloc/favorites_cubit.dart';
import 'package:tentura/features/favorites/data/favorites_repository.dart';

import '../app.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
)
Future<void> configureDependencies() => getIt.init();

class DI extends StatelessWidget {
  const DI({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteApiService = getIt<RemoteApiService>();
    return BlocSelector<AuthCubit, AuthState, String>(
      bloc: getIt<AuthCubit>(),
      selector: (state) => state.currentAccountId,
      builder: (context, accountId) => MultiBlocProvider(
        key: ValueKey(accountId),
        providers: [
          BlocProvider(
            create: (context) => ProfileCubit(
              getIt<ProfileCase>(),
              fromCache: false,
              id: accountId,
            ),
          ),
          BlocProvider(
            create: (context) => FavoritesCubit(
              FavoritesRepository(remoteApiService),
            ),
          ),
          BlocProvider(
            create: (context) => BeaconCubit(
              BeaconRepository(remoteApiService),
            ),
          ),
          BlocProvider(
            create: (_) => MyFieldCubit(getIt<MyFieldRepository>()),
          ),
          BlocProvider(
            create: (context) => ContextCubit(
              ContextRepository(remoteApiService),
            ),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
