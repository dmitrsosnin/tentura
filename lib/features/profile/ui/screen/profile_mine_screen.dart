import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/widget/gradient_stack.dart';
import 'package:tentura/ui/widget/avatar_positioned.dart';

import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_info.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_mine_control.dart';
import 'package:tentura/features/app_link/ui/widget/share_code_icon_button.dart';

import '../bloc/profile_cubit.dart';
import '../widget/profile_mine_menu_button.dart';

class ProfileMineScreen extends StatelessWidget {
  const ProfileMineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (p, c) => c.hasError,
          listener: showSnackBarError,
        ),
        BlocListener<BeaconCubit, BeaconState>(
          listenWhen: (p, c) => c.hasError,
          listener: showSnackBarError,
        ),
      ],
      child: RefreshIndicator.adaptive(
        onRefresh: () => Future.wait([
          context.read<BeaconCubit>().fetch(),
          context.read<ProfileCubit>().fetch(),
        ]),
        child: Builder(builder: (context) {
          final beaconCubit = context.watch<BeaconCubit>();
          final profileCubit = context.watch<ProfileCubit>();
          final user = profileCubit.state.user;
          final beacons = beaconCubit.state.beacons;
          return CustomScrollView(
            slivers: [
              // Header
              SliverAppBar(
                key: ValueKey(user.imageId),
                actions: [
                  // Graph View
                  IconButton(
                    icon: const Icon(Icons.hub_outlined),
                    onPressed: () => context.push(Uri(
                      path: pathGraph,
                      queryParameters: {'focus': user.id},
                    ).toString()),
                  ),

                  // Share
                  ShareCodeIconButton.id(user.id),

                  // More
                  const ProfileMineMenuButton(),
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

              // Profile
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

                      // Create
                      Row(
                        key: const Key('Control_Row'),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Beacons',
                            style: textTheme.titleLarge,
                          ),
                          FilledButton(
                            onPressed: () async {
                              await context.push(pathBeaconCreate);
                              await beaconCubit.fetch();
                            },
                            child: const Text('Create'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Beacons List
              SliverList.separated(
                key: ValueKey(beacons),
                itemCount: beacons.length,
                itemBuilder: (context, i) => Padding(
                  padding: paddingMediumH,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BeaconInfo(beacon: beacons[i]),
                      Padding(
                        padding: paddingSmallV,
                        child: BeaconMineControl(beacon: beacons[i]),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(
                  endIndent: 20,
                  indent: 20,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
