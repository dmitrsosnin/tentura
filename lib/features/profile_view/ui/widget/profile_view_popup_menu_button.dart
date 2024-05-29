import 'package:tentura/ui/utils/ferry_utils.dart';

import 'package:tentura/features/profile/domain/entity/user.dart';

import '../../data/gql/_g/user_vote_by_id.req.gql.dart';

class ProfileViewPopupMenuButton extends StatelessWidget {
  const ProfileViewPopupMenuButton({
    required this.user,
    super.key,
  });

  final User user;

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
        ],
      );
}
