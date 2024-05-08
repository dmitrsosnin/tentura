import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/domain/entity/lat_long.dart';
import 'package:tentura/data/repository/geolocation_repository.dart';

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
            maxZoom: 12,
            initialZoom: widget.center == null ? 4 : 10,
            initialCenter: widget.center ?? const LatLng(0, 0),
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            ),
            onTap: (tapPosition, point) => context.pop(point),
            onMapReady: () =>
                GetIt.I<GeolocationRepository>().getMyCoords().then(
              (value) {
                if (value == null) return;
                _mapController.move(value, _mapController.camera.zoom);
              },
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'tentura.intersubjective.space',
            ),
          ],
        ),
      );
}
