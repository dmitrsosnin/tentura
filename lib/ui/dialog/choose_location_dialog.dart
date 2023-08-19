import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/data/geolocation_repository.dart';

class ChooseLocationDialog extends StatefulWidget {
  final LatLng? center;

  const ChooseLocationDialog({
    this.center,
    super.key,
  });

  @override
  State<ChooseLocationDialog> createState() => _ChooseLocationDialogState();
}

class _ChooseLocationDialogState extends State<ChooseLocationDialog> {
  final _mapController = MapController();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

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
            center: widget.center,
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
