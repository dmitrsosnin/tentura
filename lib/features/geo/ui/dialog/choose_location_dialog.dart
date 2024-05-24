import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:tentura/ui/routes.dart';

import '../cubit/geo_cubit.dart';

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
  final _mapController = MapController();

  late final _geoCubit = context.read<GeoCubit>();

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
              final place = await _geoCubit.getPlaceNameByCoords(
                coords: point,
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
            onMapReady: () => _mapController.move(
              widget.center ?? _geoCubit.state,
              _mapController.camera.zoom,
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
