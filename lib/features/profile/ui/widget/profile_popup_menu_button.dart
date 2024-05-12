import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/dialog/show_seed_dialog.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../../data/gql/_g/user_vote_by_id.req.gql.dart';
import '../../data/user_utils.dart';

class ProfilePopupMenuButton extends StatelessWidget {
  const ProfilePopupMenuButton({
    required this.user,
    this.isMine,
    super.key,
  });

  final GUserFields user;
  final bool? isMine;

  @override
  Widget build(BuildContext context) =>
      isMine ?? context.read<AuthCubit>().checkIfIsMe(user.id)
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
                  child: const Text('Show seed'),
                  onTap: () => ShowSeedDialog.show(
                    context,
                    id: user.id,
                    seed: context.read<AuthCubit>().state.accounts[user.id]!,
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<void>(
                  onTap: () async {
                    await context.read<AuthCubit>().signOut();
                    if (context.mounted) context.go(pathAuthLogin);
                  },
                  child: const Text('Logout'),
                ),
              ],
            )
          : PopupMenuButton(
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
