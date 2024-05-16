import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/dialog/share_code_dialog.dart';

import 'package:tentura/features/image/ui/widget/avatar_image.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_by_user_id_list.dart';

import '../../data/user_utils.dart';
import '../bloc/profile_cubit.dart';
import '../widget/gradient_stack.dart';
import '../widget/avatar_positioned.dart';
import '../widget/profile_popup_menu_button.dart';

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
    return RefreshIndicator.adaptive(
      onRefresh: context.read<ProfileCubit>().fetch,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        buildWhen: (p, c) => c.status.isSuccess,
        builder: (context, state) {
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
                  IconButton(
                    icon: const Icon(Icons.share_outlined),
                    onPressed: () => ShareCodeDialog.show(
                      context,
                      id: state.user.id,
                      link: Uri.https(
                        appLinkBase,
                        pathHomeProfile,
                        {'id': state.user.id},
                      ).toString(),
                    ),
                  ),
                  // More
                  ProfilePopupMenuButton(
                    user: state.user,
                    isMine: true,
                  ),
                ],
                floating: true,
                expandedHeight: GradientStack.defaultHeight,
                flexibleSpace: FlexibleSpaceBar(
                  background: GradientStack(
                    children: [
                      AvatarPositioned(
                        child: AvatarImage(
                          userId: state.user.imageId,
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
                        state.user.title.isEmpty ? 'No name' : state.user.title,
                        textAlign: TextAlign.left,
                        style: textTheme.headlineLarge,
                      ),
                      const Padding(padding: paddingV8),
                      // Description
                      Text(
                        state.user.description,
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
                child: BeaconsByUserIdList(
                  userId: state.user.id,
                  isMine: true,
                ),
              )
            ],
          );
        },
        listenWhen: (p, c) => c.hasError,
        listener: (context, state) {
          showSnackBar(
            context,
            isError: true,
            text: state.error?.toString() ??
                'Can`t fetch profile for id: ${state.user.id}',
          );
        },
      ),
    );
  }
}
