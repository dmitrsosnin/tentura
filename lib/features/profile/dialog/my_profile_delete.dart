import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/features/profile/data/_g/profile_delete_by_user_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';

class MyProfileDeleteDialog extends StatelessWidget {
  static Future<void> show(BuildContext context) => showDialog<void>(
        context: context,
        builder: (context) => const MyProfileDeleteDialog(),
      );

  const MyProfileDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text(
          'Are you sure you want to delete your profile?',
        ),
        content: const Text(
          'All your beacons and personal data will be deleted completely.',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final myId = GetIt.I<AuthRepository>().myId;
              final response = await doRequest(
                context: context,
                request: GProfileDeleteByUserIdReq((b) => b.vars..id = myId),
              );
              if (response.hasErrors && context.mounted) {
                context.pop();
              } else {
                await GetIt.I<AuthRepository>().deleteAccount();
                if (context.mounted) context.go(pathLogin);
              }
            },
            child: const Text('Delete'),
          ),
          TextButton(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
