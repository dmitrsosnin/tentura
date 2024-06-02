import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import '../bloc/favorites_cubit.dart';

class BeaconPinIconButton extends StatefulWidget {
  const BeaconPinIconButton({
    required this.id,
    this.isPinned,
    super.key,
  });

  final String id;
  final bool? isPinned;

  @override
  State<BeaconPinIconButton> createState() => _BeaconPinIconButtonState();
}

class _BeaconPinIconButtonState extends State<BeaconPinIconButton> {
  late final _cubit = context.read<FavoritesCubit>();

  late bool _isPinned = widget.isPinned ?? false;

  @override
  Widget build(BuildContext context) => _isPinned
      ? IconButton(
          icon: const Icon(Icons.star),
          onPressed: () => _cubit.unpin(widget.id).then(
            (beacon) {
              if (mounted) setState(() => _isPinned = beacon.is_pinned!);
            },
            onError: _onError,
          ),
        )
      : IconButton(
          icon: const Icon(Icons.star_border),
          onPressed: () => _cubit.pin(widget.id).then(
            (beacon) {
              if (mounted) setState(() => _isPinned = beacon.is_pinned!);
            },
            onError: _onError,
          ),
        );

  void _onError(Object e) => showSnackBar(
        context,
        isError: true,
        text: e.toString(),
      );
}
