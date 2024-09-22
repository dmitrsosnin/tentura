import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/widget/linear_pi_active.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/beacon/ui/widget/beacon_info.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_tile_control.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_author_info.dart';
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
          return ListView(
            padding: kPaddingH,
            children: [
              // User row (Avatar and Name)
              BeaconAuthorInfo(
                author: state.beacon.author,
                beacon: state.beacon,
              ),

              // Beacon Info
              BeaconInfo(
                beacon: state.beacon,
                isTitleLarge: true,
              ),

              // Buttons Row
              if (state.isBeaconMine)
                Padding(
                  padding: kPaddingSmallV,
                  child: BeaconTileControl(
                    beacon: state.beacon,
                    key: ValueKey(state.beacon),
                  ),
                ),

              // Comments Section
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    for (final e in state.comments)
                      CommentCard(
                        comment: e,
                        isMine: state.checkIfCommentIsMine(e),
                      ),
                  ],
                ),
              ),

              // Show All Button
              if (state.comments.isNotEmpty && state.hasNotReachedMax)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 64),
                  child: FilledButton(
                    onPressed: context.read<BeaconViewCubit>().showAll,
                    child: const Text('Show all'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
