import 'package:get_it/get_it.dart';
import 'package:equatable/equatable.dart';

import 'package:gravity/core/data/api_service.dart';
import 'package:gravity/feature/auth/data/auth_repository.dart';
import 'package:gravity/feature/user/data/user_repository.dart';
import 'package:gravity/feature/user/bloc/my_profile_cubit.dart';

class DI {
  static bool _isInited = false;

  const DI();

  bool get isInited => _isInited;
  bool get isNotInited => !_isInited;

  Future<void> init() async {
    if (_isInited) return;

    EquatableConfig.stringify = true;

    // Service
    GetIt.I.registerSingleton(ApiService());

    // Repository
    GetIt.I.registerSingleton(await AuthRepository().init());
    GetIt.I.registerSingleton(UserRepository());

    // BLoC
    GetIt.I.registerSingleton(MyProfileCubit());

    _isInited = true;
  }
}
