import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:gravity/_shared/data/api_service.dart';
import 'package:gravity/auth/data/firebase_options.dart';

typedef AuthInfo = ({String id, String dn, String photoUrl});

class AuthRepository {
  final _controller = StreamController<AuthInfo>();

  late final _apiService = GetIt.I<ApiService>();

  User? _user;

  AuthInfo get authInfo => (
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
      _controller.add(authInfo);
      _apiService.getToken = user?.getIdToken;
    });
    return this;
  }

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}
