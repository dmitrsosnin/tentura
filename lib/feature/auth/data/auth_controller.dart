import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

import 'package:gravity/core/consts.dart';

class AuthController {
  static const _firebaseOptions = FirebaseOptions(
    apiKey: firebaseApiKey,
    appId: firebaseAppId,
    messagingSenderId: firebaseSenderId,
    projectId: firebaseProjectId,
    authDomain: firebaseAuthDomain,
  );

  final providers = [
    GoogleProvider(clientId: firebaseAppId),
  ];

  String get clientId => _firebaseOptions.appId;

  Future<String> get authToken =>
      FirebaseAuth.instance.currentUser!.getIdToken();

  Future<AuthController> init() async {
    await Firebase.initializeApp(options: _firebaseOptions);
    if (firebaseEmulatorPort != 0) {
      await FirebaseAuth.instance.useAuthEmulator(
        firebaseAuthDomain,
        firebaseEmulatorPort,
      );
    }
    await FirebaseAuth.instance.setPersistence(Persistence.SESSION);
    FirebaseAuth.instance.setSettings();
    return this;
  }
}
