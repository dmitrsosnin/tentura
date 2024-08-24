import 'package:flutter/material.dart';

import 'package:tentura/app/root_router.dart';
import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';
import 'package:tentura/ui/widget/avatar_positioned.dart';
import 'package:tentura/ui/widget/gradient_stack.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/beacon/ui/widget/beacon_tile.dart';

import '../../data/profile_view_repository.dart';
import '../cubit/profile_view_cubit.dart';

@RoutePage()
class ProfileViewScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileViewScreen({
    @queryParam this.id = '',
    super.key,
  });

  final String id;

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => ProfileViewCubit(
          profileViewRepository: ProfileViewRepository(
            remoteApiService: context.read<RemoteApiService>(),
          ),
          id: id,
        ),
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
          final user = state.user;
          final beacons = state.beacons;
          final textTheme = Theme.of(context).textTheme;
          return CustomScrollView(
            slivers: [
              // Header
              SliverAppBar(
                actions: [
                  // Graph View
                  IconButton(
                    icon: const Icon(Icons.hub_outlined),
                    onPressed: () => context.pushRoute(
                      GraphRoute(focus: user.id),
                    ),
                  ),

                  // Share
                  ShareCodeIconButton.id(user.id),

                  // More
                  PopupMenuButton(
                    itemBuilder: (context) => <PopupMenuEntry<void>>[
                      PopupMenuItem<void>(
                        onTap: () => context.read<ProfileViewCubit>().voteById(
                              userId: user.id,
                              amount: user.isFriend ? 0 : 1,
                            ),
                        child: user.isFriend
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
                  padding: paddingMediumH,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        user.title.isEmpty ? 'No name' : user.title,
                        textAlign: TextAlign.left,
                        style: textTheme.headlineLarge,
                      ),
                      const Padding(padding: paddingSmallV),

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
                    padding: paddingMediumH,
                    child: BeaconTile(beacon: beacons[i]),
                  ),
                  separatorBuilder: (_, __) =>
                      const Divider(endIndent: 20, indent: 20),
                ),
            ],
          );
        },
      );
}
