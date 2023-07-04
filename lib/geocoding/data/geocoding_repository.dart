import 'package:get_it/get_it.dart';

import 'package:gravity/_shared/types.dart';
import 'package:gravity/_shared/data/api_service.dart';

part 'geocoding_queries.dart';

class GeocodingRepository {
  final _apiService = GetIt.I<ApiService>();

  Future<({String city, String country})?> getPlaceByCoords(
    GeoCoords? coords,
  ) async {
    if (coords == null) return null;
    final data = await _apiService.query(
      query: _getPlaceByCoords,
      vars: {
        'lat': coords.lat,
        'long': coords.long,
      },
    );
    try {
      // ignore: avoid_dynamic_calls
      final address = (((data['getPlaceName'] as Map)['features'] as List)
          .first['properties'] as Map)['address'] as Map;
      return (
        city: address['city'] as String,
        country: address['country'] as String,
      );
    } catch (e) {
      return null;
    }
  }
}
