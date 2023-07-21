import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:gravity/firebase_options.dart';

class AuthRepository {
  final freshLink = FreshLink.oAuth2(
    tokenStorage: InMemoryTokenStorage(),
    tokenHeader: (token) => {
      'Authorization': 'Bearer ${token?.accessToken}',
    },
    refreshToken: (token, client) async {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      return token == null ? null : OAuth2Token(accessToken: token);
    },
    shouldRefresh: (response) => response.errors != null,
  );

  String? get myId => FirebaseAuth.instance.currentUser?.uid;

  Future<AuthRepository> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (kIsWeb) {
      await FirebaseAuth.instance.setPersistence(Persistence.SESSION);
    }

    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (token != null) {
      await freshLink.setToken(OAuth2Token(accessToken: token));
    }
    return this;
  }

  Future<String?> getIdToken() async =>
      await FirebaseAuth.instance.currentUser?.getIdToken();

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}
