import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:gravity/entity/beacon.dart';
import 'package:gravity/data/api_service.dart';
import 'package:gravity/features/comment/ui/widget/comment_card.dart';

import 'package:gravity/data/gql/comment/g/fetch_comments_by_beacon_id.req.gql.dart';

class CommentsExpansionTile extends StatelessWidget {
  final Beacon beacon;

  const CommentsExpansionTile({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Operation(
        client: GetIt.I<ApiService>().ferry,
        operationRequest: GFetchCommentsByBeaconIdReq(
          (b) => b..vars.beacon_id = beacon.id,
        ),
        builder: (context, response, error) {
          if (error != null) return Text(error.toString());
          if (response == null || response.loading || response.data == null) {
            return const CircularProgressIndicator.adaptive();
          }
          return ExpansionTile(
            title: Text('${response.data?.comment.length} comments'),
            children: [
              for (final c in response.data!.comment) CommentWidget(comment: c),
            ],
          );
        },
      );
}
