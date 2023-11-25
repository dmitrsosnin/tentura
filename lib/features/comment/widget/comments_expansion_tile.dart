import 'package:tentura/data/gql/comment/_g/comment_fetch_by_beacon_id.req.gql.dart';

import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/widget/error_center_text.dart';

import 'comment_card.dart';

class CommentsExpansionTile extends StatelessWidget {
  final String beaconId;
  final bool isExpanded;

  const CommentsExpansionTile({
    required this.beaconId,
    this.isExpanded = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Operation(
        client: GetIt.I<Client>(),
        operationRequest: GCommentFetchByBeaconIdReq(
          (b) => b..vars.beacon_id = beaconId,
        ),
        builder: (context, response, error) => ExpansionTile(
          initiallyExpanded: isExpanded,
          title: const Text('Comments'),
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
