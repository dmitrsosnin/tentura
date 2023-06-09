import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide AuthController;

import 'package:gravity/core/consts.dart';
import 'package:gravity/feature/auth/data/auth_controller.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) => SignInScreen(
        resizeToAvoidBottomInset: true,
        showAuthActionSwitch: true,
        actions: [
          AuthStateChangeAction<SignedIn>(
            (context, state) => context.go(pathField),
          ),
          AuthStateChangeAction<UserCreated>(
            (context, state) => context.go(pathProfile),
          ),
        ],
        providers: GetIt.I<AuthController>().providers,
      );
}
