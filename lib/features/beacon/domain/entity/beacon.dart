import '../../data/gql/_g/_fragments.data.gql.dart';

extension type const Beacon(GBeaconFields i) implements GBeaconFields {
  factory Beacon.fromJson(Map<String, Object?> json) =>
      GBeaconFieldsData.fromJson(json)! as Beacon;

  String get imageId => i.has_picture ? i.id : '';
}
