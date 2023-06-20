import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:gravity/_shared/types.dart';

class OnChooseLocationDialog extends StatelessWidget {
  static Future<GeoCoords?> show(BuildContext context) => showDialog<GeoCoords>(
        context: context,
        builder: (_) => const OnChooseLocationDialog(),
      );

  const OnChooseLocationDialog({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text('Tap to choose location'),
          forceMaterialTransparency: true,
        ),
        extendBodyBehindAppBar: true,
        body: FlutterMap(
          options: MapOptions(
            interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            onTap: (tapPosition, point) => context.pop((
              lat: point.latitude,
              long: point.longitude,
            )),
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
