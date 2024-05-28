import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/domain/entity/_g/comment.data.gql.dart';

import '../bloc/beacon_view_cubit.dart';

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
  late final _cubit = context.read<BeaconViewCubit>();

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

  // TBD: debounce
  Future<void> _updateVote(int add) async {
    _likeAmount += add;
    setState(() {});
    try {
      _likeAmount = await _cubit.voteForComment(
        commentId: widget.comment.id,
        amount: _likeAmount,
      );
      setState(() {});
    } catch (e) {
      if (mounted) {
        showSnackBar(
          context,
          isError: true,
          text: e.toString(),
        );
      }
    }
  }
}
