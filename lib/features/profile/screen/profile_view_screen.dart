import 'package:tentura/consts.dart';
import 'package:tentura/data/gql/user/user_utils.dart';

import 'package:tentura/ui/route.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/widget/gradient_stack.dart';
import 'package:tentura/ui/widget/avatar_positioned.dart';
import 'package:tentura/ui/widget/error_center_text.dart';
import 'package:tentura/ui/dialog/share_code_dialog.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/widget/beacon_tile.dart';

import '../data/_g/profile_fetch_by_user_id.req.gql.dart';
import '../widget/profile_popup_menu_button.dart';

class ProfileViewScreen extends StatelessWidget {
  static const _requestId = 'FetchProfile';

  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myId = GetIt.I<AuthCubit>().state.currentAccount;
    final userId = GoRouterState.of(context).uri.queryParameters['id'] ?? myId;
    final isMine = myId.isNotEmpty && userId == myId;
    return Operation(
      client: GetIt.I<Client>(),
      operationRequest: GProfileFetchByUserIdReq(
        (b) => b
          ..requestId = _requestId + userId
          ..vars.user_id = userId,
      ),
      builder: (context, response, error) {
        final profile = response?.data?.user_by_pk;
        final textTheme = Theme.of(context).textTheme;
        final beacons = (isMine
                ? response?.data?.user_by_pk?.beacons.toList()
                : response?.data?.user_by_pk?.beacons
                    .where((e) => e.enabled)
                    .toList(growable: false)) ??
            [];
        return Scaffold(
          floatingActionButton: isMine
              ? FloatingActionButton(
                  heroTag: 'FAB.NewBeacon',
                  child: const Icon(Icons.add),
                  onPressed: () => context.push(pathBeaconCreate),
                )
              : null,
          body: showLoaderOrErrorOr(response, error) ??
              RefreshIndicator.adaptive(
                onRefresh: () async => GetIt.I<Client>().requestController.add(
                      GProfileFetchByUserIdReq(
                        (b) => b
                          ..requestId = _requestId + userId
                          ..vars.user_id = userId,
                      ),
                    ),
                child: profile == null
                    ? const ErrorCenterText(error: 'Profile not found!')
                    : CustomScrollView(
                        slivers: [
                          // Header
                          SliverAppBar(
                            actions: [
                              // Graph View
                              IconButton(
                                icon: const Icon(Icons.hub_outlined),
                                onPressed: () => context.push(Uri(
                                  path: pathGraph,
                                  queryParameters: {'focus': userId},
                                ).toString()),
                              ),
                              // Share
                              IconButton(
                                icon: const Icon(Icons.share_outlined),
                                onPressed: () => ShareCodeDialog.show(
                                  context,
                                  id: userId,
                                  link: Uri.https(
                                    appLinkBase,
                                    pathHomeProfile,
                                    {'id': userId},
                                  ).toString(),
                                ),
                              ),
                              // More
                              ProfilePopupMenuButton(
                                user: profile,
                                isMine: isMine,
                              ),
                            ],
                            floating: true,
                            expandedHeight: GradientStack.defaultHeight,
                            flexibleSpace: FlexibleSpaceBar(
                              background: GradientStack(
                                children: [
                                  AvatarPositioned(
                                    child: AvatarImage(
                                      userId: profile.imageId,
                                      size: AvatarPositioned.childSize,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Body
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: paddingH20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  Text(
                                    profile.title.isEmpty
                                        ? 'No name'
                                        : profile.title,
                                    textAlign: TextAlign.left,
                                    style: textTheme.headlineLarge,
                                  ),
                                  const Padding(padding: paddingV8),
                                  // Description
                                  Text(
                                    profile.description,
                                    textAlign: TextAlign.left,
                                    style: textTheme.bodyLarge,
                                  ),
                                  if (profile.beacons.isNotEmpty)
                                    const Divider(),
                                ],
                              ),
                            ),
                          ),
                          // Beacons
                          if (beacons.isNotEmpty)
                            SliverList.separated(
                              itemCount: beacons.length,
                              itemBuilder: (context, i) => Padding(
                                padding: paddingH20,
                                child: BeaconTile(
                                  beacon: beacons[i],
                                  isMine: isMine,
                                ),
                              ),
                              separatorBuilder: (_, __) => const Divider(
                                indent: 20,
                                endIndent: 20,
                              ),
                            ),
                        ],
                      ),
              ),
        );
      },
    );
  }
}
