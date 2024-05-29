import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/widget/gradient_stack.dart';
import 'package:tentura/ui/widget/avatar_positioned.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/image/ui/widget/avatar_image.dart';
import 'package:tentura/features/my_field/ui/widget/beacon_tile.dart';

import '../cubit/profile_view_cubit.dart';
import '../widget/profile_view_popup_menu_button.dart';

class ProfileViewScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathProfileView,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const ProfileViewScreen(),
        redirect: (context, state) => context
                .read<AuthCubit>()
                .checkIfIsMe(state.uri.queryParameters['id'] ?? '')
            ? pathHomeProfile
            : null,
      );

  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (_) => ProfileViewCubit(
        id: GoRouterState.of(context).uri.queryParameters['id'] ?? '',
      ),
      child: Scaffold(
        body: BlocConsumer<ProfileViewCubit, ProfileViewState>(
            listenWhen: (p, c) => c.hasError,
            listener: (context, state) {
              showSnackBar(
                context,
                isError: true,
                text: state.error?.toString(),
              );
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              final user = state.user;
              final beacons = state.beacons;
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
                          queryParameters: {'focus': state.user.id},
                        ).toString()),
                      ),

                      // Share
                      ShareCodeIconButton(
                        header: state.user.id,
                        link: Uri.https(
                          appLinkBase,
                          pathProfileView,
                          {'id': state.user.id},
                        ),
                      ),

                      // More
                      ProfileViewPopupMenuButton(user: user),
                    ],
                    floating: true,
                    expandedHeight: GradientStack.defaultHeight,
                    flexibleSpace: FlexibleSpaceBar(
                      background: GradientStack(
                        children: [
                          AvatarPositioned(
                            child: AvatarImage(
                              userId: user.imageId,
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
                            user.title.isEmpty ? 'No name' : user.title,
                            textAlign: TextAlign.left,
                            style: textTheme.headlineLarge,
                          ),
                          const Padding(padding: paddingV8),

                          // Description
                          Text(
                            user.description,
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
                      separatorBuilder: (_, __) =>
                          const Divider(endIndent: 20, indent: 20),
                    ),
                ],
              );
            }),
      ),
    );
  }
}
