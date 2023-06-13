import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:gravity/core/data/api_service.dart';
import 'package:gravity/feature/auth/data/firebase_options.dart';

class AuthRepository {
  final _controller = StreamController<bool>();

  late final _apiService = GetIt.I<ApiService>();

  User? _user;

  ({String id, String dn, String photoUrl}) get authInfo => (
        id: _user?.uid ?? '',
        dn: _user?.displayName ?? '',
        photoUrl: _user?.photoURL ?? '',
      );

  Future<AuthRepository> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kIsWeb) {
      await FirebaseAuth.instance.setPersistence(Persistence.SESSION);
    }
    FirebaseAuth.instance.idTokenChanges().listen((user) async {
      _user = user;
      _apiService.authToken = await user?.getIdToken();
      _controller.add(user != null);
    });
    return this;
  }

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}
