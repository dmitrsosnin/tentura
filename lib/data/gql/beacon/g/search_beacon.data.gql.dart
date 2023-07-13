// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/beacon/g/_fragments.data.gql.dart' as _i2;
import 'package:gravity/data/gql/g/schema.schema.gql.dart' as _i3;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;
import 'package:gravity/data/gql/user/g/_fragments.data.gql.dart' as _i4;

part 'search_beacon.data.gql.g.dart';

abstract class GSearchBeaconData
    implements Built<GSearchBeaconData, GSearchBeaconDataBuilder> {
  GSearchBeaconData._();

  factory GSearchBeaconData([Function(GSearchBeaconDataBuilder b) updates]) =
      _$GSearchBeaconData;

  static void _initializeBuilder(GSearchBeaconDataBuilder b) =>
      b..G__typename = 'query_root';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GSearchBeaconData_beacon> get beacon;
  static Serializer<GSearchBeaconData> get serializer =>
      _$gSearchBeaconDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSearchBeaconData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSearchBeaconData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSearchBeaconData.serializer,
        json,
      );
}

abstract class GSearchBeaconData_beacon
    implements
        Built<GSearchBeaconData_beacon, GSearchBeaconData_beaconBuilder>,
        _i2.GbeaconFields {
  GSearchBeaconData_beacon._();

  factory GSearchBeaconData_beacon(
          [Function(GSearchBeaconData_beaconBuilder b) updates]) =
      _$GSearchBeaconData_beacon;

  static void _initializeBuilder(GSearchBeaconData_beaconBuilder b) =>
      b..G__typename = 'beacon';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  _i3.Gtimestamptz get created_at;
  @override
  _i3.Gtimestamptz get updated_at;
  @override
  _i3.Ggeography? get place;
  @override
  _i3.Gtstzrange? get timerange;
  @override
  bool get has_picture;
  @override
  bool get enabled;
  @override
  GSearchBeaconData_beacon_author get author;
  static Serializer<GSearchBeaconData_beacon> get serializer =>
      _$gSearchBeaconDataBeaconSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSearchBeaconData_beacon.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSearchBeaconData_beacon? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSearchBeaconData_beacon.serializer,
        json,
      );
}

abstract class GSearchBeaconData_beacon_author
    implements
        Built<GSearchBeaconData_beacon_author,
            GSearchBeaconData_beacon_authorBuilder>,
        _i2.GbeaconFields_author,
        _i4.GuserFields {
  GSearchBeaconData_beacon_author._();

  factory GSearchBeaconData_beacon_author(
          [Function(GSearchBeaconData_beacon_authorBuilder b) updates]) =
      _$GSearchBeaconData_beacon_author;

  static void _initializeBuilder(GSearchBeaconData_beacon_authorBuilder b) =>
      b..G__typename = 'user';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get has_picture;
  static Serializer<GSearchBeaconData_beacon_author> get serializer =>
      _$gSearchBeaconDataBeaconAuthorSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSearchBeaconData_beacon_author.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSearchBeaconData_beacon_author? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSearchBeaconData_beacon_author.serializer,
        json,
      );
}
