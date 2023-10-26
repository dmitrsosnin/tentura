// import 'package:gravity/consts.dart';
import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/features/profile/data/_g/user_vote_by_id.req.gql.dart';

import 'package:gravity/ui/utils/ui_consts.dart';
import 'package:gravity/ui/utils/ferry_utils.dart';
// import 'package:gravity/ui/dialog/share_code_dialog.dart';
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
    // final itemGraphView = PopupMenuItem<void>(
    //   onTap: () => context.push(Uri(
    //     path: pathGraph,
    //     queryParameters: {'ego': user.id},
    //   ).toString()),
    //   child: const Text('Graph view'),
    // );
    // final itemShare = PopupMenuItem<void>(
    //   onTap: () => showDialog<void>(
    //     context: context,
    //     builder: (context) => ShareCodeDialog(
    //       id: user.id,
    //       link: Uri.https(
    //         appLinkBase,
    //         pathBeaconView,
    //         {'id': user.id},
    //       ).toString(),
    //     ),
    //   ),
    //   child: const Text('Share'),
    // );
    return isMine ?? user.id == GetIt.I<AuthRepository>().myId
        ? PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<void>>[
              // Share
              // itemShare,
              // const PopupMenuDivider(),
              // Graph view
              // itemGraphView,
              // const PopupMenuDivider(),
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
              // itemShare,
              // const PopupMenuDivider(),
              // Graph view
              // itemGraphView,
              // const PopupMenuDivider(),
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
