import 'package:flutter/material.dart';

import 'package:gravity/data/gql/comment/_g/comment_fetch_by_beacon_id.data.gql.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/widget/avatar_image.dart';

import 'comment_vote_control.dart';

class CommentCard extends StatelessWidget {
  final GCommentFetchByBeaconIdData_comment comment;

  const CommentCard({
    required this.comment,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: paddingV8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: paddingH8,
              child: AvatarImage(
                userId: comment.author.has_picture ? comment.user_id : '',
                size: 40,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  comment.author.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                // Body
                Padding(
                  padding: paddingV8,
                  child: Text(
                    comment.content,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                // Buttons
                CommentVoteControl(comment: comment),
              ],
            ),
          ],
        ),
      );
}
