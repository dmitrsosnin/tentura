import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tentura/data/repository/geo_repository.dart';

class PlaceNameText extends StatelessWidget {
  const PlaceNameText({
    required this.coords,
    this.style,
    super.key,
  });

  final Coordinates coords;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final geoRepository = context.read<GeoRepository>();
    return geoRepository.cache.containsKey(coords)
        ? _buildText(geoRepository.cache[coords])
        : FutureBuilder(
            future: geoRepository.getPlaceNameByCoords(coords, useCache: false),
            builder: (context, snapshot) => _buildText(snapshot.data),
          );
  }

  Text _buildText(Place? place) => Text(
        place == null
            ? coords.toString()
            : '${place.locality}, ${place.country}',
        maxLines: 1,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: style,
      );
}
