import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/domain/entity/comment.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/image/ui/widget/avatar_image.dart';

import 'comment_vote_control.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    required this.comment,
    super.key,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          GestureDetector(
            onTap: () => context.push(Uri(
              path: pathProfileView,
              queryParameters: {'id': comment.author.id},
            ).toString()),
            child: Row(
              children: [
                // Avatar
                AvatarImage(
                  userId: comment.author.has_picture ? comment.author.id : '',
                  size: 40,
                ),
                const SizedBox(width: 20),
                // Title
                Text(
                  comment.author.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
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
          if (context.read<AuthCubit>().checkIfIsNotMe(comment.author.id))
            Container(
              alignment: Alignment.centerRight,
              padding: paddingV8,
              child: CommentVoteControl(comment: comment),
            ),
        ],
      );
}
