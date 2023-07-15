import 'package:flutter/material.dart';

import 'package:gravity/ui/widget/avatar_image.dart';

class CommentWidget extends StatelessWidget {
  final String userId;
  final String userTitle;
  final String comment;

  const CommentWidget({
    required this.userId,
    required this.userTitle,
    required this.comment,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          AvatarImage(userId: userId, size: 40),
          Column(
            children: [
              // Header
              Row(
                children: [
                  Text(userTitle),
                  const Icon(Icons.visibility_outlined),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              // Body
              Text(comment),
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
