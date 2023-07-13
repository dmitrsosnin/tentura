import 'package:flutter/material.dart';

import 'package:gravity/ui/widget/avatar_image.dart';

import 'package:gravity/data/gql/comment/g/fetch_comments_by_beacon_id.data.gql.dart';

class CommentWidget extends StatelessWidget {
  final GFetchCommentsByBeaconIdData_comment comment;

  const CommentWidget({
    required this.comment,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SizedBox.square(
            dimension: 40,
            child: AvatarImage(
              userId: comment.user_id,
              hasImage: comment.author.has_picture,
            ),
          ),
          Column(
            children: [
              // Header
              Row(
                children: [
                  Text(comment.author.title),
                  const Icon(Icons.visibility_outlined),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              // Body
              Text(comment.content),
              // Buttons
              Row(
                children: [
                  Container(),
                  TextButton.icon(
                    label: const Text('Reply'),
                    icon: const Icon(Icons.comment_bank_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}
