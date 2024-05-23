import 'package:flutter/material.dart';

import '../bloc/beacon_cubit.dart';

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
  late final _colorScheme = Theme.of(context).colorScheme;

  late int _likeAmount = widget.votes ?? 0;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: _colorScheme.secondaryContainer,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Like Button
            IconButton(
              icon: const Icon(Icons.thumb_up_outlined),
              onPressed: () => _updateVote(_likeAmount++),
            ),

            // Amount
            Text(_likeAmount.toString()),

            // Dislike Button
            IconButton(
              icon: const Icon(Icons.thumb_down_outlined),
              onPressed: () => _updateVote(_likeAmount--),
            ),
          ],
        ),
      );

  Future<void> _updateVote([int? _]) async {
    _likeAmount = await context.read<BeaconCubit>().vote(
          beaconId: widget.id,
          amount: _likeAmount,
        );
    setState(() {});
  }
}
