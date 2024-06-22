import 'package:latlong2/latlong.dart';
import 'package:built_value/serializer.dart';

// TBD: use Coordinates
class GeographySerializer implements PrimitiveSerializer<LatLng> {
  @override
  LatLng deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final coordinates = (serialized as List).last as List;
    return LatLng(coordinates.first as double, coordinates.last as double);
  }

  @override
  Object serialize(
    Serializers serializers,
    LatLng coordinates, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      {
        'type': 'Point',
        'coordinates': [coordinates.latitude, coordinates.longitude],
      };

  @override
  Iterable<Type> get types => [LatLng];

  @override
  String get wireName => 'LatLng';
}
