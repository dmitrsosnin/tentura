import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/widget/error_center_text.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/image/ui/widget/avatar_image.dart';
import 'package:tentura/features/my_field/ui/widget/beacon_tile.dart';

import '../../domain/entity/user.dart';
import '../../data/gql/_g/profile_fetch_by_user_id.req.gql.dart';
import '../widget/profile_popup_menu_button.dart';
import '../widget/avatar_positioned.dart';
import '../widget/gradient_stack.dart';

class ProfileViewScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathProfileView,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const ProfileViewScreen(),
      );

  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final userId = GoRouterState.of(context).uri.queryParameters['id'] ?? '';
    return Scaffold(
      body: Operation(
          client: GetIt.I<Client>(),
          operationRequest:
              GProfileFetchByUserIdReq((b) => b.vars.user_id = userId),
          builder: (context, response, error) {
            if (error != null) {
              return ErrorCenterText(
                response: response,
                error: error,
              );
            }
            if (response?.loading ?? true) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            final profile = response?.data?.user_by_pk as User?;
            if (profile == null) {
              return const ErrorCenterText(error: 'Profile not found!');
            }
            final beacons = response?.data?.user_by_pk?.beacons
                    .where((e) => e.enabled)
                    .map((e) => e as Beacon)
                    .toList(growable: false) ??
                [];
            return CustomScrollView(
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
                    ShareCodeIconButton(
                      header: userId,
                      link: Uri.https(
                        appLinkBase,
                        pathProfileView,
                        {'id': userId},
                      ),
                    ),

                    // More
                    ProfilePopupMenuButton(user: profile),
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
                          profile.title.isEmpty ? 'No name' : profile.title,
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
                        const Divider(),

                        Text(
                          'Beacons',
                          textAlign: TextAlign.left,
                          style: textTheme.titleLarge,
                        ),
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
                      child: BeaconTile(beacon: beacons[i]),
                    ),
                    separatorBuilder: (_, __) => const Divider(
                      endIndent: 20,
                      indent: 20,
                    ),
                  ),
              ],
            );
          }),
    );
  }
}
