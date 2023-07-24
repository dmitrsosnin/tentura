import 'package:flutter/material.dart';
import 'package:gravity/ui/consts.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: paddingH8,
            child: AvatarImage(userId: userId, size: 40),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                userTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              // Body
              Text(
                comment,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    label: const Text('Reply'),
                    icon: const Icon(Icons.comment_bank_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          // Menu
          PopupMenuButton(
            itemBuilder: (context) => const [
              PopupMenuItem<void>(
                child: Text('Share the code'),
              ),
            ],
          ),
        ],
      );
}
