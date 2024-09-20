import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/tentura_icons.dart';

import 'package:tentura/features/comment/domain/entity/comment.dart';

import '../bloc/like_cubit.dart';

class LikeCommentControl extends StatefulWidget {
  final Comment comment;

  const LikeCommentControl({
    required this.comment,
    super.key,
  });

  @override
  State<LikeCommentControl> createState() => _LikeCommentControlState();
}

class _LikeCommentControlState extends State<LikeCommentControl> {
  late final _cubit = context.read<LikeCubit>();

  late int _likeAmount = widget.comment.myVote;

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
              icon: const Icon(TenturaIcons.arrowUp),
              onPressed: () => _updateVote(1),
            ),
            Text(_likeAmount.toString()),
            IconButton(
              icon: const Icon(TenturaIcons.arrowDown),
              onPressed: () => _updateVote(-1),
            ),
          ],
        ),
      );

  // TBD: debounce
  // TBD: move to Cubit
  Future<void> _updateVote(int add) async {
    try {
      _likeAmount = (await _cubit.likeComment(
        commentId: widget.comment.id,
        amount: _likeAmount + add,
      ))!;
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
