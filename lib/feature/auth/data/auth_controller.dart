import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

import 'package:gravity/core/data/api_service.dart';
import 'package:gravity/feature/auth/data/firebase_options.dart';

class AuthController {
  late final providers = [
    GoogleProvider(clientId: DefaultFirebaseOptions.currentPlatform.appId),
  ];

  late final _apiService = GetIt.I<ApiService>();

  Future<AuthController> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kIsWeb) {
      await FirebaseAuth.instance.setPersistence(Persistence.SESSION);
    }
    return this;
  }

  Future<String?> getIdToken() async {
    return await FirebaseAuth.instance.currentUser?.getIdToken();
  }

  Future<QueryResult> createUser() => _apiService.mutate(MutationOptions(
        document: gql(createUserMutation),
      ));

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}

const createUserMutation = '''
mutation CreateUser {
  insert_users_one(object: {}) {
    uid
  }
}
''';
