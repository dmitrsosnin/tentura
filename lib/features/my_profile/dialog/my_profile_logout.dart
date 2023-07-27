import 'package:gravity/app/router.dart';

import 'package:gravity/data/auth_repository.dart';

import 'package:gravity/ui/ferry_utils.dart';

class MyProfileLogoutDialog extends StatelessWidget {
  static Future<void> show(BuildContext context) => showDialog<void>(
        context: context,
        builder: (context) => const MyProfileLogoutDialog(),
      );

  const MyProfileLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you shure?'),
        actions: [
          TextButton(
            onPressed: () async {
              await GetIt.I<AuthRepository>().signOut();
              if (context.mounted) context.go(pathLogin);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: context.pop,
            child: const Text('No'),
          ),
        ],
      );
}
