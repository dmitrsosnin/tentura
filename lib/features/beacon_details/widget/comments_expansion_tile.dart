import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:gravity/entity/beacon.dart';
import 'package:gravity/data/api_service.dart';
import 'package:gravity/ui/widget/unknown_error_text.dart';
import 'package:gravity/features/comment/ui/widget/comment_card.dart';

import 'package:gravity/data/gql/comment/_g/fetch_comments_by_beacon_id.req.gql.dart';

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
          if (response?.loading ?? false) {
            return const CircularProgressIndicator.adaptive();
          } else if (response?.data == null) {
            return unknownErrorText;
          }
          return ExpansionTile(
            title: Text('${response!.data!.comment.length} comments'),
            children: [
              for (final c in response.data!.comment)
                CommentWidget(
                  userId: c.author.has_picture ? c.user_id : '',
                  userTitle: c.author.title,
                  comment: c.content,
                ),
            ],
          );
        },
      );
}
