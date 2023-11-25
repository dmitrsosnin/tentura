import 'package:tentura/app/router.dart';
import 'package:tentura/data/auth_repository.dart';
import 'package:tentura/data/gql/user/user_utils.dart';
import 'package:tentura/features/profile/data/_g/user_vote_by_id.req.gql.dart';

import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

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
    final authRepo = GetIt.I<AuthRepository>();
    return isMine ?? user.id == authRepo.myId
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
              const PopupMenuDivider(),
              PopupMenuItem<void>(
                onTap: () async {
                  await authRepo.signOut();
                  if (context.mounted) context.go(pathLogin);
                },
                child: const Text('Logout'),
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
                  child: const Text('Remove from my field'),
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
