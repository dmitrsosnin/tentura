import 'package:gravity/ui/ferry.dart';

import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/data/gql/vote/_g/vote_for_beacon_by_id.req.gql.dart';

class LikeControlButton extends StatefulWidget {
  final GBeaconFields beacon;

  const LikeControlButton({
    required this.beacon,
    super.key,
  });

  @override
  State<LikeControlButton> createState() => _LikeControlButtonState();
}

class _LikeControlButtonState extends State<LikeControlButton> {
  late int _likeAmount = widget.beacon.my_vote ?? 0;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).colorScheme.surfaceVariant,
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

  Future<void> _updateVote([int? amount]) => GetIt.I<Client>()
          .request(GVoteForBeaconByIdReq(
            (b) => b
              ..vars.amount = _likeAmount
              ..vars.beacon_id = widget.beacon.id,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
        (response) {
          final amount = response.data?.insert_vote_beacon_one?.amount;
          if (amount != null) setState(() => _likeAmount = amount);
        },
      );
}
