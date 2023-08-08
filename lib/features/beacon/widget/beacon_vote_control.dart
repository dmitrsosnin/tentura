import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/data/gql/beacon/_g/beacon_vote_by_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';

class BeaconVoteControl extends StatefulWidget {
  final GBeaconFields beacon;

  const BeaconVoteControl({
    required this.beacon,
    super.key,
  });

  @override
  State<BeaconVoteControl> createState() => _BeaconVoteControlState();
}

class _BeaconVoteControlState extends State<BeaconVoteControl> {
  late int _likeAmount = widget.beacon.my_vote ?? 0;

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
        request: GBeaconVoteByIdReq(
          (b) => b
            ..vars.amount = _likeAmount
            ..vars.beacon_id = widget.beacon.id,
        ),
      ).then(
        (response) {
          final amount = response.data?.insert_vote_beacon_one?.amount;
          if (amount != null) setState(() => _likeAmount = amount);
        },
      );
}
