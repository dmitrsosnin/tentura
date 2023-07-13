// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/beacon/g/_fragments.data.gql.dart' as _i2;
import 'package:gravity/data/gql/g/schema.schema.gql.dart' as _i3;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;
import 'package:gravity/data/gql/user/g/_fragments.data.gql.dart' as _i4;

part 'create_beacon.data.gql.g.dart';

abstract class GCreateBeaconData
    implements Built<GCreateBeaconData, GCreateBeaconDataBuilder> {
  GCreateBeaconData._();

  factory GCreateBeaconData([Function(GCreateBeaconDataBuilder b) updates]) =
      _$GCreateBeaconData;

  static void _initializeBuilder(GCreateBeaconDataBuilder b) =>
      b..G__typename = 'mutation_root';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateBeaconData_insert_beacon_one? get insert_beacon_one;
  static Serializer<GCreateBeaconData> get serializer =>
      _$gCreateBeaconDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateBeaconData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateBeaconData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateBeaconData.serializer,
        json,
      );
}

abstract class GCreateBeaconData_insert_beacon_one
    implements
        Built<GCreateBeaconData_insert_beacon_one,
            GCreateBeaconData_insert_beacon_oneBuilder>,
        _i2.GbeaconFields {
  GCreateBeaconData_insert_beacon_one._();

  factory GCreateBeaconData_insert_beacon_one(
          [Function(GCreateBeaconData_insert_beacon_oneBuilder b) updates]) =
      _$GCreateBeaconData_insert_beacon_one;

  static void _initializeBuilder(
          GCreateBeaconData_insert_beacon_oneBuilder b) =>
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
  GCreateBeaconData_insert_beacon_one_author get author;
  static Serializer<GCreateBeaconData_insert_beacon_one> get serializer =>
      _$gCreateBeaconDataInsertBeaconOneSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateBeaconData_insert_beacon_one.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateBeaconData_insert_beacon_one? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateBeaconData_insert_beacon_one.serializer,
        json,
      );
}

abstract class GCreateBeaconData_insert_beacon_one_author
    implements
        Built<GCreateBeaconData_insert_beacon_one_author,
            GCreateBeaconData_insert_beacon_one_authorBuilder>,
        _i2.GbeaconFields_author,
        _i4.GuserFields {
  GCreateBeaconData_insert_beacon_one_author._();

  factory GCreateBeaconData_insert_beacon_one_author(
      [Function(GCreateBeaconData_insert_beacon_one_authorBuilder b)
          updates]) = _$GCreateBeaconData_insert_beacon_one_author;

  static void _initializeBuilder(
          GCreateBeaconData_insert_beacon_one_authorBuilder b) =>
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
  static Serializer<GCreateBeaconData_insert_beacon_one_author>
      get serializer => _$gCreateBeaconDataInsertBeaconOneAuthorSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateBeaconData_insert_beacon_one_author.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateBeaconData_insert_beacon_one_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateBeaconData_insert_beacon_one_author.serializer,
        json,
      );
}
