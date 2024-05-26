import 'package:flutter/material.dart';

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
  late bool _isFavorite = widget.isPinned ?? false;

  @override
  Widget build(BuildContext context) => _isFavorite
      ? IconButton(
          icon: const Icon(Icons.star),
          onPressed: () async {
            await context.read<FavoritesCubit>().unpin(widget.id);
            setState(() => _isFavorite = false);
          },
        )
      : IconButton(
          icon: const Icon(Icons.star_border),
          onPressed: () async {
            await context.read<FavoritesCubit>().pin(widget.id);
            setState(() => _isFavorite = true);
          },
        );
}
