import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:gravity/_shared/types.dart';

class ChooseLocationDialog extends StatelessWidget {
  final void Function(GeoCoords coords) setCoords;

  const ChooseLocationDialog({
    required this.setCoords,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tap to choose location'),
          forceMaterialTransparency: true,
        ),
        extendBodyBehindAppBar: true,
        body: FlutterMap(
          options: MapOptions(
            interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            onTap: (tapPosition, point) {
              setCoords((lat: point.latitude, long: point.longitude));
              Navigator.of(context).pop();
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'gravity.intersubjective.space',
            ),
          ],
        ),
      );
}
