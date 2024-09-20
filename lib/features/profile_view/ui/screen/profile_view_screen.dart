import 'package:flutter/material.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';
import 'package:tentura/ui/widget/avatar_positioned.dart';
import 'package:tentura/ui/widget/gradient_stack.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/like/ui/bloc/like_cubit.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_tile.dart';
import 'package:tentura/ui/widget/tentura_icons.dart';
import 'package:tentura/ui/widget/show_more_text.dart';

import '../bloc/profile_view_cubit.dart';

@RoutePage()
class ProfileViewScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileViewScreen({
    @queryParam this.id = '',
    super.key,
  });

  final String id;

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => ProfileViewCubit(id: id),
        child: this,
      );

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ProfileViewCubit, ProfileViewState>(
        listenWhen: (p, c) => c.hasError,
        listener: showSnackBarError,
        buildWhen: (p, c) => c.hasNoError,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          final profile = state.profile;
          final beacons = state.beacons;
          final theme = Theme.of(context);
          return DecoratedBox(
            decoration: BoxDecoration(color: theme.colorScheme.surface),
            child: CustomScrollView(
              slivers: [
                // Header
                SliverAppBar(
                  actions: [
                    // Graph View
                    IconButton(
                      icon: const Icon(TenturaIcons.graph),
                      onPressed: () =>
                          context.pushRoute(GraphRoute(focus: profile.id)),
                    ),

                    // Share
                    ShareCodeIconButton.id(profile.id),

                    // More
                    PopupMenuButton(
                      itemBuilder: (context) => <PopupMenuEntry<void>>[
                        PopupMenuItem<void>(
                          onTap: () => context.read<LikeCubit>().likeUser(
                                userId: profile.id,
                                amount: profile.isFriend ? 0 : 1,
                              ),
                          child: profile.isFriend
                              ? const Text('Remove from my field')
                              : const Text('Add to my field'),
                        )
                      ],
                    ),
                  ],
                  floating: true,
                  expandedHeight: GradientStack.defaultHeight,
                  leading: const AutoLeadingButton(),

                  // Avatar
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
                    padding: kPaddingH,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          profile.title.isEmpty ? 'No name' : profile.title,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.headlineLarge,
                        ),
                        const Padding(padding: kPaddingSmallV),

                        // Description
                        ShowMoreText(
                          profile.description,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const Divider(),

                        const Padding(padding: kPaddingSmallT),

                        Text(
                          'Beacons',
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),

                // Beacons
                if (beacons.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: kPaddingAll,
                      child: Text(
                        'There are no beacons yet',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  )
                else
                  SliverList.separated(
                    itemCount: beacons.length,
                    itemBuilder: (context, i) => Padding(
                      padding: kPaddingAll,
                      child: BeaconTile(beacon: beacons[i]),
                    ),
                    separatorBuilder: (_, __) =>
                        const Divider(endIndent: 20, indent: 20),
                  ),
              ],
            ),
          );
        },
      );
}
