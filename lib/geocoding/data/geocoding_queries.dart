part of 'geocoding_repository.dart';

const _getPlaceByCoords = r'''
query ReverseGeocoding($lat: Float!, $long: Float!) {
  getPlaceName(lat: $lat, long: $long) {
    features {
      properties {
        address {
          city
          country
        }
      }
    }
  }
}
''';
