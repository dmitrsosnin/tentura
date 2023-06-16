import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:gravity/_shared/data/api_service.dart';
import 'package:gravity/_shared/firebase_options.dart';

class AuthRepository {
  final _controller = StreamController<String?>();

  String _myId = '';

  String get myId => _myId;

  Future<AuthRepository> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kIsWeb) {
      await FirebaseAuth.instance.setPersistence(Persistence.SESSION);
    }
    FirebaseAuth.instance.idTokenChanges().listen((user) {
      GetIt.I<ApiService>().getToken = user?.getIdToken;
      _myId = user?.uid ?? '';
      _controller.add(myId);
    });
    return this;
  }

  Future<void> signOut() {
    _myId = '';
    _controller.add(myId);
    return FirebaseAuth.instance.signOut();
  }
}
