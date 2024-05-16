import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

import '../../data/gql/_g/user_vote_by_id.req.gql.dart';
import '../../data/user_utils.dart';

class ProfilePopupMenuButton extends StatelessWidget {
  const ProfilePopupMenuButton({
    required this.user,
    super.key,
  });

  final GUserFields user;

  @override
  Widget build(BuildContext context) => PopupMenuButton(
        itemBuilder: (context) => <PopupMenuEntry<void>>[
          if ((user.my_vote ?? 0) <= 0)
            PopupMenuItem<void>(
              onTap: () => doRequest(
                context: context,
                request: GUserVoteByIdReq(
                  (b) => b
                    ..vars.object = user.id
                    ..vars.amount = 1,
                ),
              ),
              child: const Text('Add to my field'),
            )
          else
            PopupMenuItem<void>(
              child: const Text('Remove from my field'),
              onTap: () => doRequest(
                context: context,
                request: GUserVoteByIdReq(
                  (b) => b
                    ..vars.object = user.id
                    ..vars.amount = 0,
                ),
              ),
            ),
          const PopupMenuDivider(),
          PopupMenuItem<void>(
            child: const Text('Show hidden Beacons'),
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(notImplementedSnackBar);
            },
          ),
        ],
      );
}
