import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

import 'package:gravity/_app/router.dart';
import 'package:gravity/firebase_options.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) => SignInScreen(
        showAuthActionSwitch: true,
        actions: [
          AuthStateChangeAction<SignedIn>(
            (context, state) => context.go(pathField),
          ),
          AuthStateChangeAction<UserCreated>(
            (context, state) => context.go(pathProfile),
          ),
        ],
        providers: [
          GoogleProvider(clientId: DefaultFirebaseOptions.currentPlatform.appId)
        ],
      );
}
