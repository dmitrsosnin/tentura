import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';

class UpdatesScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeUpdates,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const UpdatesScreen(),
      );

  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(notImplementedSnackBar);
              },
              child: const Text('Mark all as read'),
            )
          ],
        ),
        body: Center(
          child: Text(
            'Nothing here yet',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      );
}
