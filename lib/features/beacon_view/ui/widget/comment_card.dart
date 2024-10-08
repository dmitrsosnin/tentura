import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/domain/entity/comment.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import 'comment_vote_control.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    required this.comment,
    super.key,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isMine = GetIt.I<AuthCubit>().checkIfIsMe(comment.author.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        GestureDetector(
          onTap: () => context.pushRoute(ProfileViewRoute(
            id: comment.author.id,
          )),
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
                isMine ? 'Me' : comment.author.title,
                style: textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        // Body
        Padding(
          padding: paddingSmallV,
          child: Text(
            comment.content,
            style: textTheme.bodyLarge,
          ),
        ),
        // Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Share
            ShareCodeIconButton.id(comment.id),
            // Vote
            if (!isMine)
              Container(
                alignment: Alignment.centerRight,
                padding: paddingSmallV,
                child: CommentVoteControl(comment: comment),
              ),
          ],
        ),
      ],
    );
  }
}
