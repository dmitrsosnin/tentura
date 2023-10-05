import 'package:gravity/consts.dart';
import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/user/user_utils.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/dialog/share_code_dialog.dart';
// import 'package:gravity/features/profile/dialog/my_profile_delete.dart';
// import 'package:gravity/features/profile/dialog/my_profile_logout.dart';

class ProfilePopupMenuButton extends StatelessWidget {
  final GUserFields user;
  final bool? isMine;

  const ProfilePopupMenuButton({
    required this.user,
    this.isMine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final itemGraphView = PopupMenuItem<void>(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(notImplementedSnackBar);
      },
      child: const Text('Graph view'),
    );
    final itemShare = PopupMenuItem<void>(
      onTap: () => showDialog<void>(
        context: context,
        builder: (context) => ShareCodeDialog(
          id: user.id,
          link: Uri.https(
            appLinkBase,
            pathBeaconView,
            {'id': user.id},
          ).toString(),
        ),
      ),
      child: const Text('Share'),
    );
    return isMine ?? user.id == GetIt.I<AuthRepository>().myId
        ? PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<void>>[
              // Share
              itemShare,
              const PopupMenuDivider(),
              // Graph view
              itemGraphView,
              const PopupMenuDivider(),
              // Edit profile
              PopupMenuItem<void>(
                onTap: () => context.push(pathProfileEdit),
                child: const Text('Edit profile'),
              ),
              // const PopupMenuDivider(),
              // Delete profile
              // PopupMenuItem<void>(
              //   onTap: () => MyProfileDeleteDialog.show(context),
              //   child: const Text('Delete profile'),
              // ),
              // const PopupMenuDivider(),
              // Log out
              // PopupMenuItem<void>(
              //   onTap: () => MyProfileLogoutDialog.show(context),
              //   child: const Text('Logout'),
              // ),
            ],
          )
        : PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<void>>[
              // Share
              itemShare,
              const PopupMenuDivider(),
              // Graph view
              itemGraphView,
              const PopupMenuDivider(),
              if ((user.my_vote ?? 0) < 0)
                PopupMenuItem<void>(
                  onTap: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(notImplementedSnackBar);
                  },
                  child: const Text('Remove my field'),
                )
              else
                PopupMenuItem<void>(
                  child: const Text('Add to my field'),
                  onTap: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(notImplementedSnackBar);
                  },
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
