import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/tentura_icons.dart';

import '../bloc/beacon_cubit.dart';

class BeaconVoteControl extends StatefulWidget {
  const BeaconVoteControl({
    required this.id,
    required this.votes,
    super.key,
  });

  final String id;
  final int votes;

  @override
  State<BeaconVoteControl> createState() => _BeaconVoteControlState();
}

class _BeaconVoteControlState extends State<BeaconVoteControl> {
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
              style: _theme.textTheme.bodyLarge,
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
  Future<void> _updateVote(int add) async {
    _likeAmount += add;
    setState(() {});
    try {
      _likeAmount = await context.read<BeaconCubit>().vote(
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
