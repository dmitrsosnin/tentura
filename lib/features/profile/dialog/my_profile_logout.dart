import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

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
              await GetIt.I<AuthCubit>().signOut();
              if (context.mounted) context.go(pathAuthLogin);
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
