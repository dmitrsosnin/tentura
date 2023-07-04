import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:gravity/_shared/types.dart';

class ChooseLocationDialog extends StatelessWidget {
  final void Function(GeoCoords coords) setCoords;
  final GeoCoords? center;

  const ChooseLocationDialog({
    required this.setCoords,
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
            center: center == null ? null : LatLng(center!.lat, center!.long),
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
