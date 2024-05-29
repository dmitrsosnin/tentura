import '../../data/gql/_g/_fragments.data.gql.dart';

extension type const Beacon(GBeaconFields i) implements GBeaconFields {
  static final _zeroDateTime = DateTime.fromMillisecondsSinceEpoch(0);

  static final empty = (GBeaconFieldsDataBuilder()
        ..id = ''
        ..title = ''
        ..description = ''
        ..enabled = false
        ..has_picture = false
        ..comments_count = 0
        ..created_at = _zeroDateTime
        ..updated_at = _zeroDateTime
        ..author = (GBeaconFieldsData_authorBuilder()
          ..id = ''
          ..title = ''
          ..description = ''
          ..has_picture = false))
      .build() as Beacon;

  factory Beacon.fromJson(Map<String, Object?> json) =>
      GBeaconFieldsData.fromJson(json)! as Beacon;

  String get imageId => i.has_picture ? i.id : '';

  Beacon copyWith() => (GBeaconFieldsDataBuilder()
        ..id = ''
        ..title = ''
        ..description = ''
        ..enabled = false
        ..has_picture = false
        ..comments_count = 0
        ..created_at = _zeroDateTime
        ..updated_at = _zeroDateTime
        ..author = (GBeaconFieldsData_authorBuilder()
          ..id = ''
          ..title = ''
          ..description = ''
          ..has_picture = false))
      .build() as Beacon;
}
