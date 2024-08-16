import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tentura/data/repository/geo_repository.dart';

class ChooseLocationDialog extends StatefulWidget {
  static Future<Location?> show(
    BuildContext context, {
    Coordinates? center,
  }) =>
      showDialog<Location>(
        context: context,
        builder: (_) => ChooseLocationDialog(center: center),
      );

  final Coordinates? center;

  const ChooseLocationDialog({
    this.center,
    super.key,
  });

  @override
  State<ChooseLocationDialog> createState() => _ChooseLocationDialogState();
}

class _ChooseLocationDialogState extends State<ChooseLocationDialog> {
  final _mapController = MapController();

  late final _geoRepository = context.read<GeoRepository>();

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
            initialCenter: LatLng(
              widget.center?.lat ?? 0,
              widget.center?.long ?? 0,
            ),
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            ),
            onTap: (tapPosition, point) async {
              final coords = (lat: point.latitude, long: point.longitude);
              final place = await _geoRepository.getPlaceNameByCoords(coords);
              if (context.mounted) {
                await context.maybePop((coords: coords, place: place));
              }
            },
            onMapReady: () {
              final center = widget.center ?? _geoRepository.myCoordinates;
              if (center != null) {
                _mapController.move(
                  LatLng(center.lat, center.long),
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
