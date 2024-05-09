import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/widget/avatar_image.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../../data/gql/_g/comment_fetch_by_beacon_id.data.gql.dart';
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
          if (GetIt.I<AuthCubit>().checkIfIsNotMe(comment.user_id))
            Container(
              alignment: Alignment.centerRight,
              padding: paddingV8,
              child: CommentVoteControl(comment: comment),
            ),
        ],
      );
}
