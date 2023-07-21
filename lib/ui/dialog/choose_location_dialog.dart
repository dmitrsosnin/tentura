import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/data/geolocation_repository.dart';

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
  final _mapController = MapController();

  ChooseLocationDialog({
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
          mapController: _mapController,
          options: MapOptions(
            zoom: 10,
            maxZoom: 12,
            center: center,
            interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            onTap: (tapPosition, point) => context.pop(point),
            onMapReady: () =>
                GetIt.I<GeolocationRepository>().getMyCoords().then(
              (value) {
                if (value == null) return;
                _mapController.move(value, _mapController.zoom);
              },
            ),
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
