import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/comment/_g/comment_fetch_by_beacon_id.data.gql.dart';

import 'package:gravity/ui/utils/ui_consts.dart';
import 'package:gravity/ui/utils/ferry_utils.dart';
import 'package:gravity/ui/widget/avatar_image.dart';

import 'comment_vote_control.dart';

class CommentCard extends StatelessWidget {
  final GCommentFetchByBeaconIdData_comment comment;

  const CommentCard({
    required this.comment,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          GestureDetector(
            onTap: () => context.push(Uri(
              path: pathProfileView,
              queryParameters: {'id': comment.user_id},
            ).toString()),
            child: Row(
              children: [
                // Avatar
                AvatarImage(
                  userId: comment.author.has_picture ? comment.user_id : '',
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
          if (comment.user_id != GetIt.I<AuthRepository>().myId)
            Container(
              alignment: Alignment.centerRight,
              padding: paddingV8,
              child: CommentVoteControl(comment: comment),
            ),
        ],
      );
}
