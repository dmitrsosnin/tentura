import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:tentura/features/geo/data/geo_repository.dart';
import 'package:tentura/domain/entity/lat_long.dart';
import 'package:tentura/ui/routes.dart';

typedef LocationResult = ({
  LatLng point,
  String? country,
  String? locality,
});

class ChooseLocationDialog extends StatefulWidget {
  static Future<LocationResult?> show(
    BuildContext context, {
    LatLng? center,
  }) =>
      showDialog<LocationResult>(
        context: context,
        builder: (_) => ChooseLocationDialog(center: center),
      );

  final LatLng? center;

  const ChooseLocationDialog({
    this.center,
    super.key,
  });

  @override
  State<ChooseLocationDialog> createState() => _ChooseLocationDialogState();
}

class _ChooseLocationDialogState extends State<ChooseLocationDialog> {
  final _geoRepository = GetIt.I<GeoRepository>();
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
            onTap: (tapPosition, point) async {
              final place = await _geoRepository.getPlaceByCoords(
                point,
                useCache: true,
              );
              if (context.mounted) {
                context.pop((
                  point: point,
                  country: place?.country,
                  locality: place?.locality,
                ));
              }
            },
            onMapReady: () async {
              final point = widget.center ?? await _geoRepository.getMyCoords();
              if (point != null) {
                _mapController.move(
                  point,
                  _mapController.camera.zoom,
                );
              }
            },
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
