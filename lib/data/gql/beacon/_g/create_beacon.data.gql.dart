// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' as _i4;
import 'package:gravity/data/gql/_g/serializers.gql.dart' as _i1;
import 'package:gravity/data/gql/beacon/_g/_fragments.data.gql.dart' as _i2;
import 'package:gravity/data/gql/user/_g/_fragments.data.gql.dart' as _i5;
import 'package:latlong2/latlong.dart' as _i3;

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
  DateTime get created_at;
  @override
  DateTime get updated_at;
  @override
  _i3.LatLng? get place;
  @override
  _i4.DateTimeRange? get timerange;
  @override
  bool get has_picture;
  @override
  int get comments_count;
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
        _i5.GuserFields {
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
