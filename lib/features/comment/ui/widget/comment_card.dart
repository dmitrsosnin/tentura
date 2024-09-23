import 'package:flutter/material.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/features/like/ui/widget/like_comment_control.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';
import 'package:tentura/ui/widget/show_more_text.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import '../../domain/entity/comment.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    required this.comment,
    this.isMine = false,
    super.key,
  });

  final Comment comment;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: kPaddingSmallT,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              GestureDetector(
                onTap: () =>
                    context.pushRoute(ProfileViewRoute(id: comment.author.id)),
                child: Padding(
                  padding: const EdgeInsets.only(right: kSpacingMedium),
                  child: AvatarImage(
                    userId: comment.author.imageId,
                    size: 40,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    GestureDetector(
                      onTap: () => context
                          .pushRoute(ProfileViewRoute(id: comment.author.id)),
                      child: Text(
                        isMine ? 'Me' : comment.author.title,
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    // Body
                    Padding(
                      padding: kPaddingSmallT,
                      child: ShowMoreText(
                        comment.content,
                        style: ShowMoreText.buildTextStyle(context),
                      ),
                    ),
                  ],
                ),
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
                child: LikeCommentControl(
                  comment: comment,
                  key: ValueKey(comment),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
