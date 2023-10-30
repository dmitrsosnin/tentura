import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/features/profile/data/_g/user_vote_by_id.req.gql.dart';

import 'package:gravity/ui/utils/ui_consts.dart';
import 'package:gravity/ui/utils/ferry_utils.dart';

class ProfilePopupMenuButton extends StatelessWidget {
  const ProfilePopupMenuButton({
    required this.user,
    this.isMine,
    super.key,
  });

  final GUserFields user;
  final bool? isMine;

  @override
  Widget build(BuildContext context) {
    return isMine ?? user.id == GetIt.I<AuthRepository>().myId
        ? PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<void>>[
              PopupMenuItem<void>(
                onTap: () => context.push(pathRating),
                child: const Text('View rating'),
              ),
              const PopupMenuDivider(),
              PopupMenuItem<void>(
                onTap: () => context.push(pathProfileEdit),
                child: const Text('Edit profile'),
              ),
            ],
          )
        : PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<void>>[
              if ((user.my_vote ?? 0) <= 0)
                PopupMenuItem<void>(
                  onTap: () async => doRequest(
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
                  child: const Text('Remove my field'),
                  onTap: () async => doRequest(
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
}
