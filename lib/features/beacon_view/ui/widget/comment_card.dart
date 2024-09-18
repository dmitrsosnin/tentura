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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              Padding(
                padding: const EdgeInsets.only(right: kSpacingDefault),
                child: AvatarImage(
                  userId: comment.author.has_picture ? comment.author.id : '',
                  size: 40,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    isMine ? 'Me' : comment.author.title,
                    style: textTheme.headlineMedium,
                  ),
                  // Body
                  Padding(
                    padding: kPaddingSmallT,
                    child: Text(
                      comment.content,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Share
            ShareCodeIconButton.id(comment.id),
            // Vote
            if (!isMine)
              Container(
                alignment: Alignment.centerRight,
                padding: kPaddingSmallV,
                child: CommentVoteControl(comment: comment),
              ),
          ],
        ),
      ],
    );
  }
}
