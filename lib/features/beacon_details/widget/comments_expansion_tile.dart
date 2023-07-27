import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/data/gql/comment/_g/comment_fetch_by_beacon_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/error_center_text.dart';

import 'comment_card.dart';

class CommentsExpansionTile extends StatelessWidget {
  final GBeaconFields beacon;

  const CommentsExpansionTile({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Operation(
        client: GetIt.I<Client>(),
        operationRequest: GCommentFetchByBeaconIdReq(
          (b) => b
            ..fetchPolicy = FetchPolicy.CacheAndNetwork
            ..vars.beacon_id = beacon.id,
        ),
        builder: (context, response, error) => ExpansionTile(
          title: Text('${beacon.comments_count} comments'),
          trailing: response?.loading ?? false
              ? const CircularProgressIndicator.adaptive()
              : null,
          children: response?.data == null
              ? [ErrorCenterText(response: response, error: error)]
              : [
                  for (final c in response!.data!.comment)
                    CommentCard(comment: c),
                ],
        ),
      );
}
