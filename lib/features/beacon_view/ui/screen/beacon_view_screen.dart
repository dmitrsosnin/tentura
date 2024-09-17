import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/widget/linear_pi_active.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_info.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_tile_control.dart';

import '../../data/beacon_view_repository.dart';
import '../bloc/beacon_view_cubit.dart';
import '../widget/comment_card.dart';
import '../widget/new_comment_input.dart';

@RoutePage()
class BeaconViewScreen extends StatelessWidget implements AutoRouteWrapper {
  const BeaconViewScreen({
    @queryParam this.id = '',
    @queryParam this.initiallyExpanded = false,
    super.key,
  });

  final String id;
  final bool initiallyExpanded;

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => BeaconViewCubit(
          GetIt.I<BeaconViewRepository>(),
          fetchCommentsOnStart: initiallyExpanded,
          id: id,
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
          final author = state.beacon.author as User;
          final textTheme = Theme.of(context).textTheme;
          return RefreshIndicator.adaptive(
            onRefresh: beaconViewCubit.fetch,
            child: ListView(
              padding: paddingMediumA,
              children: [
                // User row (Avatar and Name)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      AvatarImage(
                        userId: author.imageId,
                        size: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          author.title,
                          style: textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),

                // Beacon Info
                BeaconInfo(beacon: state.beacon),

                // Buttons Row
                if (authCubit.checkIfIsNotMe(author.id))
                  Padding(
                    padding: paddingSmallV,
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
                    initiallyExpanded:
                        initiallyExpanded || state.hasFocusedComment,
                    onExpansionChanged: (isExpanded) =>
                        isExpanded && state.comments.isEmpty
                            ? beaconViewCubit.fetch()
                            : null,
                    children: state.comments
                        .map((e) => CommentCard(comment: e))
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
