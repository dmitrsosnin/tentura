import 'package:get_it/get_it.dart';

import 'package:gravity/feature/auth/data/auth_controller.dart';

class DI {
  static bool _isInited = false;

  const DI();

  bool get isInited => _isInited;
  bool get isNotInited => !_isInited;

  Future<void> init() async {
    if (_isInited) return;

    GetIt.I.registerSingleton(await AuthController().init());

    _isInited = true;
  }
}
