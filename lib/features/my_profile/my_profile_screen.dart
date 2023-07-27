import 'package:gravity/app/router.dart';

import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/gql/user/_g/user_fetch_by_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/rating_button.dart';
import 'package:gravity/ui/widget/gradient_stack.dart';
import 'package:gravity/ui/widget/avatar_positioned.dart';
import 'package:gravity/ui/widget/error_center_text.dart';

import 'dialog/my_profile_delete.dart';
import 'dialog/my_profile_logout.dart';

class MyProfileScreen extends StatelessWidget {
  static const _requestId = 'FetchMyProfile';

  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry<void>>[
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
            ),
          ],
          backgroundColor: Colors.transparent,
          leadingWidth: RatingButton.width,
          leading: const RatingButton(),
        ),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        // Body
        body: Operation(
          client: GetIt.I<Client>(),
          operationRequest: GUserFetchByIdReq(
            (b) => b
              ..requestId = _requestId
              ..vars.id = GetIt.I<AuthRepository>().myId,
          ),
          builder: (context, response, error) {
            final profile = response?.data?.user_by_pk;
            if (profile == null) {
              return response?.loading ?? false
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : ErrorCenterText(response: response, error: error);
            }
            final textTheme = Theme.of(context).textTheme;
            return RefreshIndicator.adaptive(
              onRefresh: () async =>
                  GetIt.I<Client>().requestController.add(GUserFetchByIdReq(
                        (b) => b
                          ..requestId = _requestId
                          ..fetchPolicy = FetchPolicy.NetworkOnly
                          ..vars.id = GetIt.I<AuthRepository>().myId,
                      )),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Header
                  GradientStack(
                    children: [
                      AvatarPositioned(
                        child: AvatarImage(
                          userId: profile.imageId,
                          size: AvatarPositioned.childSize,
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
