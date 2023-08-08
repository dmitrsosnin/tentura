import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

import 'package:gravity/firebase_options.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/data/gql/user/_g/user_create.req.gql.dart';
import 'package:gravity/ui/ferry_utils.dart';

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
            (context, state) async {
              final response = await doRequest(
                context: context,
                request: GUserCreateReq(
                  (b) => b..vars.title = state.credential.user?.displayName,
                ),
              );
              if (context.mounted && response.hasNoErrors) {
                context.go(pathProfileEdit);
              }
            },
          ),
        ],
        providers: [
          AppleProvider(),
          GoogleProvider(
            clientId: DefaultFirebaseOptions.currentPlatform.appId,
          ),
        ],
      );
}
