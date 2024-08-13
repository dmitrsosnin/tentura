import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import '../bloc/my_field_cubit.dart';

class BeaconVoteControl extends StatefulWidget {
  const BeaconVoteControl({
    required this.id,
    this.votes,
    super.key,
  });

  final String id;
  final int? votes;

  @override
  State<BeaconVoteControl> createState() => _BeaconVoteControlState();
}

class _BeaconVoteControlState extends State<BeaconVoteControl> {
  late final _theme = Theme.of(context);
  late final _myFieldCubit = context.read<MyFieldCubit>();

  late int _likeAmount = widget.votes ?? 0;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: _theme.colorScheme.secondaryContainer,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Like Button
            IconButton(
              icon: const Icon(Icons.thumb_up_outlined),
              onPressed: () async => _updateVote(1),
            ),

            // Amount
            Text(
              _likeAmount.toString(),
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: _theme.textTheme.bodyLarge,
            ),

            // Dislike Button
            IconButton(
              icon: const Icon(Icons.thumb_down_outlined),
              onPressed: () async => _updateVote(-1),
            ),
          ],
        ),
      );

  // TBD: debounce
  Future<void> _updateVote(int add) async {
    _likeAmount += add;
    setState(() {});
    try {
      _likeAmount = await _myFieldCubit.vote(
        beaconId: widget.id,
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
