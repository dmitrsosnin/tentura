import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
  final _likeCubit = GetIt.I<LikeCubit>();

  late int _likeAmount = _likeCubit.getLikeAmount(widget.comment);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: theme.colorScheme.secondaryContainer,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(TenturaIcons.arrowUp),
            onPressed: () async {
              _likeAmount = await _likeCubit.setLikeAmount(
                entity: widget.comment,
                amount: _likeAmount + 1,
              );
              setState(() {});
            },
          ),
          Text(
            _likeAmount.toString(),
            style: theme.textTheme.bodyMedium,
          ),
          IconButton(
            icon: const Icon(TenturaIcons.arrowDown),
            onPressed: () async {
              _likeAmount = await _likeCubit.setLikeAmount(
                entity: widget.comment,
                amount: _likeAmount - 1,
              );
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
