import 'package:gravity/app/router.dart';

import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/user/_g/user_fetch_by_id.req.gql.dart';

import 'package:gravity/ui/ferry.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/rating_button.dart';
import 'package:gravity/ui/widget/header_gradient.dart';
import 'package:gravity/ui/widget/error_center_text.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry<void>>[
                // Share
                PopupMenuItem<void>(
                  onTap: () {},
                  child: const Text('Share'),
                ),
                // Edit profile
                PopupMenuItem<void>(
                  onTap: () => context.push(pathProfileEdit),
                  child: const Text('Edit profile'),
                ),
                const PopupMenuDivider(),
                // Delete profile
                PopupMenuItem<void>(
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Are you sure you want to delete your profile?',
                      ),
                      content: const Text(
                        'All your beacons and personal data will be deleted completely.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            // TBD
                            if (context.mounted) context.go(pathLogin);
                          },
                          child: const Text('Delete'),
                        ),
                        TextButton(
                          onPressed: context.pop,
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ),
                  child: const Text('Delete profile'),
                ),
                const PopupMenuDivider(),
                // Log out
                PopupMenuItem<void>(
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Log out'),
                      content: const Text('Are you shure?'),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            await GetIt.I<AuthRepository>().signOut();
                            if (context.mounted) context.go(pathLogin);
                          },
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          onPressed: context.pop,
                          child: const Text('No'),
                        ),
                      ],
                    ),
                  ),
                  child: const Text('Logout'),
                ),
              ],
            ),
          ],
          backgroundColor: Colors.transparent,
          leadingWidth: RatingButton.width,
          leading: const RatingButton(),
        ),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        // FAB to Graph
        // floatingActionButton: FloatingActionButton(
        //   heroTag: 'FAB.MyProfile',
        //   child: const Icon(Icons.share_rounded),
        //   onPressed: () => context.push(pathGraphView),
        // ),
        // Body
        body: Operation(
          client: GetIt.I<Client>(),
          operationRequest: GUserFetchByIdReq(
            (b) => b..vars.id = GetIt.I<AuthRepository>().myId,
          ),
          builder: (context, response, error) {
            if (response?.loading ?? false) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (response?.data?.user_by_pk == null) {
              return ErrorCenterText(response: response, error: error);
            }
            final profile = response!.data!.user_by_pk!;
            final textTheme = Theme.of(context).textTheme;
            return RefreshIndicator.adaptive(
              onRefresh: () async {},
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Header
                  Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.passthrough,
                    children: [
                      // Gradient
                      const HeaderGradient(),
                      // Avatar
                      Positioned(
                        top: 100,
                        left: 50,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 8,
                              color: Colors.white,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: AvatarImage(
                            userId: profile.has_picture ? profile.id : '',
                            size: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Display Name
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Text(
                      profile.title.isEmpty ? 'No name' : profile.title,
                      style: textTheme.headlineLarge,
                      maxLines: 1,
                    ),
                  ),
                  // User Description
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Text(
                      profile.description,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
