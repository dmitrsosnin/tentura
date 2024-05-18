import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/dialog/share_code_dialog.dart';

import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_tile.dart';
import 'package:tentura/features/image/ui/widget/avatar_image.dart';

import '../../data/user_utils.dart';
import '../bloc/profile_cubit.dart';
import '../widget/gradient_stack.dart';
import '../widget/avatar_positioned.dart';
import '../widget/my_profile_menu_button.dart';

class ProfileMineScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeProfile,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const ProfileMineScreen(),
      );

  const ProfileMineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final beaconCubit = context.read<BeaconCubit>();
    final profileCubit = context.read<ProfileCubit>();

    Future<void> refresh() async {
      profileCubit.fetch();
      await beaconCubit.fetch();
    }

    return BlocConsumer<ProfileCubit, ProfileState>(
      buildWhen: (p, c) => c.status.isSuccess,
      builder: (context, state) {
        final profile = state.user;
        return RefreshIndicator.adaptive(
          key: const Key('ProfileHeader'),
          onRefresh: refresh,
          child: CustomScrollView(
            slivers: [
              // Header
              SliverAppBar(
                actions: [
                  // Graph View
                  IconButton(
                    icon: const Icon(Icons.hub_outlined),
                    onPressed: () => context.push(Uri(
                      path: pathGraph,
                      queryParameters: {'focus': profile.id},
                    ).toString()),
                  ),
                  // Share
                  IconButton(
                    icon: const Icon(Icons.share_outlined),
                    onPressed: () => ShareCodeDialog.show(
                      context,
                      id: profile.id,
                      link: Uri.https(
                        appLinkBase,
                        pathHomeProfile,
                        {'id': profile.id},
                      ).toString(),
                    ),
                  ),
                  // More
                  const MyProfileMenuButton(),
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
                      // Create
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Beacons',
                            style: textTheme.titleLarge,
                          ),
                          FilledButton(
                            onPressed: () => context.push(pathBeaconCreate),
                            child: const Text('Create'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Beacons List
              SliverFillRemaining(
                child: BlocConsumer<BeaconCubit, BeaconState>(
                  key: const Key('ProfileBeacons'),
                  buildWhen: (p, c) => c.status.isSuccess,
                  builder: (context, state) {
                    return RefreshIndicator.adaptive(
                      key: const Key('ProfileBeaconsList'),
                      onRefresh: refresh,
                      child: ListView.separated(
                        itemCount: state.beacons.length,
                        itemBuilder: (context, i) => Padding(
                          padding: paddingH20,
                          child: BeaconTile(
                            beacon: state.beacons[i],
                            withAvatar: false,
                            isMine: true,
                          ),
                        ),
                        separatorBuilder: (_, __) => const Divider(
                          endIndent: 20,
                          indent: 20,
                        ),
                      ),
                    );
                  },
                  listenWhen: (p, c) => c.hasError,
                  listener: (context, state) {
                    showSnackBar(
                      context,
                      isError: true,
                      text: state.error?.toString(),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
      listenWhen: (p, c) => c.hasError,
      listener: (context, state) {
        showSnackBar(
          context,
          isError: true,
          text: state.error?.toString(),
        );
      },
    );
  }
}
