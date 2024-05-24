import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:tentura/domain/entity/lat_long.dart';
import 'package:tentura/domain/entity/place_name.dart';

import '../../data/geo_repository.dart';

class PlaceNameText extends StatelessWidget {
  const PlaceNameText({
    required this.coords,
    this.style,
    super.key,
  });

  final LatLng coords;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final geoRepository = GetIt.I<GeoRepository>();
    return geoRepository.cache.containsKey(coords)
        ? _buildText(
            geoRepository.cache[coords],
            style ?? Theme.of(context).textTheme.bodyLarge,
          )
        : FutureBuilder(
            future: geoRepository.getPlaceByCoords(coords),
            builder: (context, snapshot) => _buildText(
              snapshot.data,
              style ?? Theme.of(context).textTheme.bodyLarge,
            ),
          );
  }

  Text _buildText(PlaceName? place, TextStyle? style) => Text(
        place == null
            ? coords.toSexagesimal()
            : '${place.locality}, ${place.country}',
        style: style,
      );
}
