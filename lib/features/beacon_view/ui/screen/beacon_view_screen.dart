import 'package:flutter/material.dart';

import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/widget/beacon_image.dart';
import 'package:tentura/ui/widget/place_name_text.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/my_field/ui/widget/beacon_tile_control.dart';

import '../bloc/beacon_view_cubit.dart';
import '../widget/comment_card.dart';
import '../widget/new_comment_input.dart';

class BeaconViewScreen extends StatelessWidget {
  const BeaconViewScreen({
    required this.isExpanded,
    super.key,
  });

  final bool isExpanded;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Beacon'),
        ),
        bottomSheet: const NewCommentInput(),
        body: BlocConsumer<BeaconViewCubit, BeaconViewState>(
          listenWhen: (p, c) => c.hasError,
          listener: (context, state) {
            showSnackBar(
              context,
              isError: true,
              text: state.error?.toString(),
            );
          },
          builder: (context, state) {
            final beacon = state.beacon;
            final author = beacon.author as User;
            final textTheme = Theme.of(context).textTheme;
            return ListView(
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

                // Title
                Text(
                  beacon.title,
                  style: textTheme.headlineMedium,
                ),

                // Image of Beacon
                if (beacon.has_picture)
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: BeaconImage(
                        authorId: author.id,
                        beaconId: beacon.imageId,
                        height: 200,
                      ),
                    ),
                  ),

                // Description
                if (beacon.description.isNotEmpty)
                  Text(
                    beacon.description,
                    style: textTheme.bodyLarge,
                  ),

                // Date
                if (beacon.timerange != null)
                  Text(
                    '${fYMD(beacon.timerange?.start)} - ${fYMD(beacon.timerange?.end)}',
                    style: textTheme.bodyLarge,
                  ),

                // Place
                if (beacon.hasCoordinates)
                  PlaceNameText(
                    coords: beacon.coordinates!,
                    style: textTheme.bodyLarge,
                  ),

                // Buttons Row
                if (context.read<AuthCubit>().checkIfIsNotMe(author.id))
                  Padding(
                    padding: paddingSmallV,
                    child: BeaconTileControl(beacon: beacon),
                  ),

                // Comments
                if (beacon.comments_count > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 64),
                    child: ExpansionTile(
                      key: ValueKey(state.comments),
                      initiallyExpanded: isExpanded,
                      title: const Text('Comments'),
                      trailing: state.status.isLoading
                          ? const CircularProgressIndicator.adaptive()
                          : null,
                      children: [
                        for (final c in state.comments) CommentCard(comment: c),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      );
}
