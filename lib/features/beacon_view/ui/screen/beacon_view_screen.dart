import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/widget/beacon_image.dart';
import 'package:tentura/ui/widget/place_name_text.dart';
import 'package:tentura/domain/entity/user.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/my_field/ui/widget/beacon_tile_control.dart';

import '../../data/beacon_view_repository.dart';
import '../bloc/beacon_view_cubit.dart';
import '../widget/comment_card.dart';
import '../widget/new_comment_input.dart';

class BeaconViewScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathBeaconView,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const BeaconViewScreen(),
      );

  const BeaconViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final queryParameters = GoRouterState.of(context).uri.queryParameters;
    final beaconId = queryParameters['id']!;
    return BlocProvider(
      create: (context) => BeaconViewCubit.build(
        id: beaconId,
        gqlClient: context.read<Client>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Beacon'),
        ),
        bottomSheet: NewCommentInput(beaconId: beaconId),
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
            return ListView(
              padding: paddingAll20,
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
                        padding: paddingH8,
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
                    padding: paddingV20,
                    child: ClipRRect(
                      borderRadius: borderRadius20,
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
                if (beacon.place != null)
                  PlaceNameText(
                    coords: (
                      lat: beacon.place!.latitude,
                      long: beacon.place!.longitude,
                    ),
                    style: textTheme.bodyLarge,
                  ),

                // Buttons Row
                if (context.read<AuthCubit>().checkIfIsNotMe(author.id))
                  Padding(
                    padding: paddingV8,
                    child: BeaconTileControl(beacon: beacon),
                  ),

                // Comments
                if (beacon.comments_count > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 64),
                    child: ExpansionTile(
                      key: ValueKey(state.comments),
                      initiallyExpanded: queryParameters['expanded'] == 'true',
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
      ),
    );
  }
}
