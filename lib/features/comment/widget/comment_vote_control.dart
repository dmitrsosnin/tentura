import 'package:gravity/data/gql/comment/_g/_fragments.data.gql.dart';
import 'package:gravity/data/gql/comment/_g/comment_vote_by_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';

class CommentVoteControl extends StatefulWidget {
  final GCommentFields comment;

  const CommentVoteControl({
    required this.comment,
    super.key,
  });

  @override
  State<CommentVoteControl> createState() => _CommentVoteControlState();
}

class _CommentVoteControlState extends State<CommentVoteControl> {
  late int _likeAmount = widget.comment.my_vote ?? 0;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.thumb_up_outlined),
              onPressed: () => _updateVote(_likeAmount++),
            ),
            Text(_likeAmount.toString()),
            IconButton(
              icon: const Icon(Icons.thumb_down_outlined),
              onPressed: () => _updateVote(_likeAmount--),
            ),
          ],
        ),
      );

  Future<void> _updateVote([int? amount]) => doRequest(
        context: context,
        request: GCommentVoteByIdReq(
          (b) => b
            ..vars.amount = _likeAmount
            ..vars.comment_id = widget.comment.id,
        ),
      ).then(
        (response) {
          final amount = response.data?.insert_vote_comment_one?.amount;
          if (amount != null) setState(() => _likeAmount = amount);
        },
      );
}
