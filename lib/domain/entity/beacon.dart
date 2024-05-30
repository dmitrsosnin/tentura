import 'package:tentura/consts.dart';

import '_g/beacon.data.gql.dart';

extension type const Beacon(GBeaconFields i) implements GBeaconFields {
  static final empty = (GBeaconFieldsDataBuilder()
        ..id = ''
        ..title = ''
        ..description = ''
        ..enabled = false
        ..has_picture = false
        ..comments_count = 0
        ..created_at = zeroDateTime
        ..updated_at = zeroDateTime
        ..author = (GBeaconFieldsData_authorBuilder()
          ..id = ''
          ..title = ''
          ..description = ''
          ..has_picture = false))
      .build() as Beacon;

  factory Beacon.fromJson(Map<String, Object?> json) =>
      GBeaconFieldsData.fromJson(json)! as Beacon;

  String get imageId => i.has_picture ? i.id : '';

  Beacon copyWith({
    String? id,
    String? title,
    String? description,
    bool? hasPicture,
    bool? isPinned,
    bool? enabled,
    int? myVote,
    int? commentsCount,
  }) =>
      (GBeaconFieldsDataBuilder()
            ..id = id ?? this.id
            ..title = title ?? this.title
            ..description = description ?? this.description
            ..enabled = enabled ?? this.enabled
            ..is_pinned = isPinned ?? is_pinned
            ..has_picture = hasPicture ?? has_picture
            ..comments_count = commentsCount ?? comments_count
            ..my_vote = myVote ?? my_vote
            ..created_at = created_at
            ..updated_at = updated_at
            ..author = (GBeaconFieldsData_authorBuilder()
              ..id = ''
              ..title = ''
              ..description = ''
              ..has_picture = false))
          .build() as Beacon;
}
