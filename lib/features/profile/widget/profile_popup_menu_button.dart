import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';

import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/features/profile/dialog/my_profile_delete.dart';
import 'package:gravity/features/profile/dialog/my_profile_logout.dart';

class ProfilePopupMenuButton extends StatelessWidget {
  final String userId;
  final bool? isMine;

  const ProfilePopupMenuButton({
    required this.userId,
    this.isMine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final itemGraphView = PopupMenuItem<void>(
      onTap: () => context.push(pathProfileEdit),
      child: const Text('Graph view'),
    );
    return isMine ?? userId == GetIt.I<AuthRepository>().myId
        ? PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<void>>[
              // Graph view
              itemGraphView,
              const PopupMenuDivider(),
              // Edit profile
              PopupMenuItem<void>(
                onTap: () => context.push(pathProfileEdit),
                child: const Text('Edit profile'),
              ),
              const PopupMenuDivider(),
              // Delete profile
              PopupMenuItem<void>(
                onTap: () => MyProfileDeleteDialog.show(context),
                child: const Text('Delete profile'),
              ),
              const PopupMenuDivider(),
              // Log out
              PopupMenuItem<void>(
                onTap: () => MyProfileLogoutDialog.show(context),
                child: const Text('Logout'),
              ),
            ],
          )
        : PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<void>>[
              // Graph view
              itemGraphView,
              const PopupMenuDivider(),
              const PopupMenuItem<void>(
                child: Text('Add to my field'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<void>(
                child: Text('Remove from my field'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<void>(
                child: Text('Show hidden Beacons'),
              ),
            ],
          );
  }
}
