import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:gravity/types.dart';

class ChooseLocationDialog extends StatelessWidget {
  static Future<LatLng?> show({
    required BuildContext context,
    LatLng? center,
  }) =>
      showDialog<LatLng>(
        context: context,
        builder: (context) => ChooseLocationDialog(center: center),
      );

  final LatLng? center;

  const ChooseLocationDialog({
    this.center,
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
            zoom: 10,
            maxZoom: 12,
            center: center,
            interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            onTap: (tapPosition, point) => Navigator.of(context).pop(point),
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
