import 'package:tentura/ui/utils/ferry_utils.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../../data/gql/_g/beacon_pin_by_id.req.gql.dart';
import '../../data/gql/_g/beacon_unpin_by_id.req.gql.dart';
import '../../data/beacon_utils.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({
    required this.beacon,
    super.key,
  });

  final GBeaconFields beacon;

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
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
              ..user_id = GetIt.I<AuthCubit>().state.currentAccount
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
