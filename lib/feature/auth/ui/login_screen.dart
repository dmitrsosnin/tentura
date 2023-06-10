import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide AuthController;

import 'package:gravity/core/consts.dart';
import 'package:gravity/feature/auth/data/auth_controller.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = GetIt.I<AuthController>();
    return SignInScreen(
      resizeToAvoidBottomInset: true,
      showAuthActionSwitch: true,
      actions: [
        AuthStateChangeAction<SignedIn>(
          (context, state) {
            if (kDebugMode) print('SignedIn');
            context.go(pathField);
          },
        ),
        AuthStateChangeAction<UserCreated>(
          (context, state) async {
            if (kDebugMode) print('UserCreated');
            try {
              final result = await authController.createUser();
              if (kDebugMode) print(result.data);
            } catch (e) {
              if (kDebugMode) print(e);
            }
            if (context.mounted) context.go(pathProfile);
          },
        ),
      ],
      providers: authController.providers,
    );
  }
}
