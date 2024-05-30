import 'package:flutter/material.dart';

import 'package:tentura/domain/entity/lat_long.dart';

import '../cubit/geo_cubit.dart';

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
    final geoCubit = context.read<GeoCubit>();
    return geoCubit.cache.containsKey(coords)
        ? _buildText(
            geoCubit.cache[coords],
            style ?? Theme.of(context).textTheme.bodyLarge,
          )
        : FutureBuilder(
            future: geoCubit.getPlaceNameByCoords(
              coords: coords,
              useCache: false,
            ),
            builder: (context, snapshot) => _buildText(
              snapshot.data,
              style ?? Theme.of(context).textTheme.bodyLarge,
            ),
          );
  }

  Text _buildText(
    ({String? country, String? locality})? place,
    TextStyle? style,
  ) =>
      Text(
        place == null
            ? coords.toSexagesimal()
            : '${place.locality}, ${place.country}',
        style: style,
      );
}
