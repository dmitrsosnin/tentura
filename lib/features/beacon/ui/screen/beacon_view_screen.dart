import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/screens/error_screen.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/widget/beacon_image.dart';
import 'package:tentura/ui/widget/error_center_text.dart';
import 'package:tentura/data/repository/geolocation_repository.dart';

import 'package:tentura/features/profile/data/user_utils.dart';
import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/comment/ui/widget/new_comment_input.dart';
import 'package:tentura/features/comment/ui/widget/comments_expansion_tile.dart';

import '../../data/beacon_utils.dart';
import '../../data/gql/_g/beacon_fetch_by_id.req.gql.dart';
import '../widget/beacon_control_row.dart';

class BeaconViewScreen extends StatelessWidget {
  static const _requestId = 'FetchBeaconById';

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
    final beaconId = queryParameters['id'];
    if (beaconId == null || beaconId.isEmpty) {
      return const ErrorScreen(
        title: 'Beacon',
        error: 'Beacon identifier is wrong!',
      );
    }
    final client = GetIt.I<Client>();
    final refreshRequest = GBeaconFetchByIdReq(
      (b) => b
        ..requestId = _requestId + beaconId
        ..vars.id = beaconId,
    );
    return Operation(
      client: client,
      operationRequest: GBeaconFetchByIdReq(
        (b) => b
          ..requestId = _requestId + beaconId
          ..vars.id = beaconId,
      ),
      builder: (context, response, error) {
        final beacon = response?.data?.beacon_by_pk;
        if (beacon == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Beacon')),
            body: response?.loading ?? false
                ? const Center(child: CircularProgressIndicator.adaptive())
                : ErrorCenterText(response: response, error: error),
          );
        }
        final isMine = GetIt.I<AuthCubit>().checkIfIsMe(beacon.author.id);
        return Scaffold(
          appBar: AppBar(title: const Text('Beacon')),
          bottomSheet: NewCommentInput(
            beaconId: beaconId,
            refreshRequest: refreshRequest,
          ),
          body: RefreshIndicator.adaptive(
            onRefresh: () async => client.requestController.add(refreshRequest),
            child: ListView(
              padding: paddingAll20,
              children: [
                // User row (Avatar and Name)
                if (!isMine)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        AvatarImage(
                          userId: beacon.author.imageId,
                          size: 40,
                        ),
                        Padding(
                          padding: paddingH8,
                          child: Text(
                            beacon.author.title,
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
                        authorId: beacon.author.id,
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
                Text(
                  fYMD(beacon.created_at),
                  style: textTheme.bodyLarge,
                ),
                // Place
                if (beacon.place != null)
                  FutureBuilder(
                    key: Key(beaconId),
                    future: GetIt.I<GeolocationRepository>()
                        .getPlaceNameByCoords(beacon.place!),
                    builder: (context, snapshot) => Text(
                      snapshot.data == null
                          ? beacon.place!.toSexagesimal()
                          : '${snapshot.data?.locality}, ${snapshot.data?.country}',
                      style: textTheme.bodyLarge,
                    ),
                  ),
                // Buttons Row
                Padding(
                  padding: paddingV8,
                  child: BeaconControlRow(beacon: beacon, isMine: isMine),
                ),
                // Comments
                if (beacon.comments_count > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 64),
                    child: CommentsExpansionTile(
                      key: ObjectKey(beacon),
                      isExpanded: queryParameters['expanded'] == 'true',
                      beaconId: beacon.id,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
