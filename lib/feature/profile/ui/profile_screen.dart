import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/core/consts.dart';
import 'package:gravity/feature/auth/data/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = GetIt.I<AuthController>();
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.create_new_folder_rounded),
          onPressed: () async {
            final result = await authController.createUser();
            if (kDebugMode) print(result.data ?? result.exception);
          },
        ),
        IconButton(
          icon: const Icon(Icons.print),
          onPressed: () async {
            if (kDebugMode) print(await authController.getIdToken());
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout_rounded),
          onPressed: () async {
            await authController.signOut();
            if (context.mounted) context.go(pathLogin);
          },
        ),
      ]),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<String?>(
          future: authController.getIdToken(),
          builder: (context, snapshot) => snapshot.hasData
              ? Text('${snapshot.data}')
              : const Text('Profile'),
        ),
      ),
    );
  }
}
