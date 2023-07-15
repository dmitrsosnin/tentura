// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' as _i2;
import 'package:gravity/data/gql/_g/serializers.gql.dart' as _i4;
import 'package:gravity/data/gql/user/_g/_fragments.data.gql.dart' as _i3;
import 'package:latlong2/latlong.dart' as _i1;

part '_fragments.data.gql.g.dart';

abstract class GbeaconFields {
  String get G__typename;
  String get id;
  String get title;
  String get description;
  DateTime get created_at;
  DateTime get updated_at;
  _i1.LatLng? get place;
  _i2.DateTimeRange? get timerange;
  bool get has_picture;
  bool get enabled;
  GbeaconFields_author get author;
  Map<String, dynamic> toJson();
}

abstract class GbeaconFields_author implements _i3.GuserFields {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get has_picture;
  @override
  Map<String, dynamic> toJson();
}

abstract class GbeaconFieldsData
    implements
        Built<GbeaconFieldsData, GbeaconFieldsDataBuilder>,
        GbeaconFields {
  GbeaconFieldsData._();

  factory GbeaconFieldsData([Function(GbeaconFieldsDataBuilder b) updates]) =
      _$GbeaconFieldsData;

  static void _initializeBuilder(GbeaconFieldsDataBuilder b) =>
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
  _i1.LatLng? get place;
  @override
  _i2.DateTimeRange? get timerange;
  @override
  bool get has_picture;
  @override
  bool get enabled;
  @override
  GbeaconFieldsData_author get author;
  static Serializer<GbeaconFieldsData> get serializer =>
      _$gbeaconFieldsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GbeaconFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GbeaconFieldsData? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GbeaconFieldsData.serializer,
        json,
      );
}

abstract class GbeaconFieldsData_author
    implements
        Built<GbeaconFieldsData_author, GbeaconFieldsData_authorBuilder>,
        GbeaconFields_author,
        _i3.GuserFields {
  GbeaconFieldsData_author._();

  factory GbeaconFieldsData_author(
          [Function(GbeaconFieldsData_authorBuilder b) updates]) =
      _$GbeaconFieldsData_author;

  static void _initializeBuilder(GbeaconFieldsData_authorBuilder b) =>
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
  static Serializer<GbeaconFieldsData_author> get serializer =>
      _$gbeaconFieldsDataAuthorSerializer;
  @override
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GbeaconFieldsData_author.serializer,
        this,
      ) as Map<String, dynamic>);
  static GbeaconFieldsData_author? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GbeaconFieldsData_author.serializer,
        json,
      );
}
