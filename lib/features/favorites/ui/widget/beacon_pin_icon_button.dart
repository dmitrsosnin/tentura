import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';

import '../bloc/favorites_cubit.dart';

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
  late final _cubit = context.read<FavoritesCubit>();

  late bool _isPinned = widget.beacon.isPinned;

  @override
  Widget build(BuildContext context) => _isPinned
      ? IconButton(
          icon: const Icon(Icons.star),
          onPressed: () async => _setPin(false),
        )
      : IconButton(
          icon: const Icon(Icons.star_border),
          onPressed: () async => _setPin(true),
        );

  Future<void> _setPin(bool isPinned) async {
    try {
      final beacon = isPinned
          ? await _cubit.pin(widget.beacon)
          : await _cubit.unpin(widget.beacon);
      if (mounted) setState(() => _isPinned = beacon.isPinned);
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
