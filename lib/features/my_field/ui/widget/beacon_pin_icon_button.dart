import 'package:tentura/ui/utils/ferry_utils.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/domain/entity/beacon.dart';

import '../../data/gql/_g/beacon_pin_by_id.req.gql.dart';
import '../../data/gql/_g/beacon_unpin_by_id.req.gql.dart';

class BeaconPinIconButton extends StatefulWidget {
  const BeaconPinIconButton({
    required this.beacon,
    super.key,
  });

  final Beacon beacon;

  @override
  State<BeaconPinIconButton> createState() => _BeaconPinIconButtonState();
}

class _BeaconPinIconButtonState extends State<BeaconPinIconButton> {
  late bool _isFavorite = widget.beacon.is_pinned ?? false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          _isFavorite ? const Icon(Icons.star) : const Icon(Icons.star_border),
      onPressed: () async {
        if (_isFavorite) {
          final result = await doRequest(
            context: context,
            request: GBeaconUnpinByIdReq((b) => b.vars
              ..user_id = context.read<AuthCubit>().state.currentAccount
              ..beacon_id = widget.beacon.id),
          );
          if (result.hasNoErrors) setState(() => _isFavorite = false);
        } else {
          final result = await doRequest(
            context: context,
            request:
                GBeaconPinByIdReq((b) => b..vars.beacon_id = widget.beacon.id),
          );
          if (result.hasNoErrors) setState(() => _isFavorite = true);
        }
      },
    );
  }
}
