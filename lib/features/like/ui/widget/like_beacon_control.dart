import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/tentura_icons.dart';

import '../bloc/like_cubit.dart';

class LikeBeaconControl extends StatefulWidget {
  const LikeBeaconControl({
    required this.id,
    required this.votes,
    super.key,
  });

  final String id;
  final int votes;

  @override
  State<LikeBeaconControl> createState() => _LikeBeaconControlState();
}

class _LikeBeaconControlState extends State<LikeBeaconControl> {
  late int _likeAmount = widget.votes;

  late final _theme = Theme.of(context);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: _theme.splashColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Like Button
            IconButton(
              icon: const Icon(TenturaIcons.arrowUp),
              onPressed: () async => _updateVote(1),
            ),

            // Amount
            Text(
              _likeAmount.toString(),
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: _theme.textTheme.bodyMedium,
            ),

            // Dislike Button
            IconButton(
              icon: const Icon(TenturaIcons.arrowDown),
              onPressed: () async => _updateVote(-1),
            ),
          ],
        ),
      );

  // TBD: debounce
  // TBD: use BlocSelector<LikeCubit
  Future<void> _updateVote(int add) async {
    final result = await GetIt.I<LikeCubit>().likeBeacon(
      beaconId: widget.id,
      amount: _likeAmount + add,
    );
    if (result == null) {
      if (mounted) {
        showSnackBar(
          context,
          isError: true,
          text: 'Can`t set like for [${widget.id}]',
        );
      }
    } else {
      setState(() => _likeAmount = result);
    }
  }
}
