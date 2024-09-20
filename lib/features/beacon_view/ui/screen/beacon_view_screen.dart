import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/widget/linear_pi_active.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_info.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_tile_control.dart';
import 'package:tentura/features/comment/ui/widget/comment_card.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';

import '../bloc/beacon_view_cubit.dart';
import '../widget/new_comment_input.dart';

@RoutePage()
class BeaconViewScreen extends StatelessWidget implements AutoRouteWrapper {
  const BeaconViewScreen({
    @queryParam this.id = '',
    super.key,
  });

  final String id;

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => BeaconViewCubit(
          id: id,
          myProfile: GetIt.I<ProfileCubit>().state.profile,
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final authCubit = GetIt.I<AuthCubit>();
    final beaconViewCubit = context.read<BeaconViewCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beacon'),
        leading: const AutoLeadingButton(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: BlocSelector<BeaconViewCubit, BeaconViewState, FetchStatus>(
            selector: (state) => state.status,
            builder: (context, status) => status.isLoading
                ? const LinearPiActive()
                : const SizedBox(height: 4),
          ),
        ),
      ),
      bottomSheet: const NewCommentInput(),
      body: BlocConsumer<BeaconViewCubit, BeaconViewState>(
        listenWhen: (p, c) => c.hasError,
        listener: showSnackBarError,
        buildWhen: (p, c) => c.status.isSuccess,
        builder: (context, state) {
          final author = state.beacon.author;
          final textTheme = Theme.of(context).textTheme;
          return RefreshIndicator.adaptive(
            onRefresh: beaconViewCubit.fetch,
            child: ListView(
              padding: kPaddingAll,
              children: [
                // User row (Avatar and Name)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: kSpacingDefault),
                      child: AvatarImage(
                        userId: author.imageId,
                        size: 40,
                      ),
                    ),
                    Text(
                      author.title,
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),

                // Beacon Info
                BeaconInfo(
                  beacon: state.beacon,
                  isTitleLarge: true,
                ),

                // Buttons Row
                if (authCubit.checkIfIsNotMe(author.id))
                  Padding(
                    padding: kPaddingSmallV,
                    child: BeaconTileControl(
                      beacon: state.beacon,
                      key: ValueKey(state.beacon),
                    ),
                  ),

                // Comments ExpansionTile
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 64),
                  child: ExpansionTile(
                    maintainState: true,
                    title: const Text('Comments'),
                    initiallyExpanded: state.hasFocusedComment,
                    onExpansionChanged: (isExpanded) =>
                        isExpanded && state.comments.isEmpty
                            ? beaconViewCubit.fetch()
                            : null,
                    children: state.comments
                        .map((e) => CommentCard(
                              comment: e,
                              isMine: authCubit.checkIfIsMe(e.author.id),
                            ))
                        .toList(growable: false),
                  ),
                ),

                // Show All Button
                if (state.hasFocusedComment)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 64),
                    child: FilledButton(
                      onPressed: beaconViewCubit.showAll,
                      child: const Text('Show all'),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
