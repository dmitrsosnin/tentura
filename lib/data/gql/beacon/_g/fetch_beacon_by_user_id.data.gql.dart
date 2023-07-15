// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' as _i4;
import 'package:gravity/data/gql/_g/serializers.gql.dart' as _i1;
import 'package:gravity/data/gql/beacon/_g/_fragments.data.gql.dart' as _i2;
import 'package:gravity/data/gql/user/_g/_fragments.data.gql.dart' as _i5;
import 'package:latlong2/latlong.dart' as _i3;

part 'fetch_beacon_by_user_id.data.gql.g.dart';

abstract class GFetchBeaconsByUserIdData
    implements
        Built<GFetchBeaconsByUserIdData, GFetchBeaconsByUserIdDataBuilder> {
  GFetchBeaconsByUserIdData._();

  factory GFetchBeaconsByUserIdData(
          [Function(GFetchBeaconsByUserIdDataBuilder b) updates]) =
      _$GFetchBeaconsByUserIdData;

  static void _initializeBuilder(GFetchBeaconsByUserIdDataBuilder b) =>
      b..G__typename = 'query_root';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GFetchBeaconsByUserIdData_beacon> get beacon;
  static Serializer<GFetchBeaconsByUserIdData> get serializer =>
      _$gFetchBeaconsByUserIdDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchBeaconsByUserIdData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchBeaconsByUserIdData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchBeaconsByUserIdData.serializer,
        json,
      );
}

abstract class GFetchBeaconsByUserIdData_beacon
    implements
        Built<GFetchBeaconsByUserIdData_beacon,
            GFetchBeaconsByUserIdData_beaconBuilder>,
        _i2.GbeaconFields {
  GFetchBeaconsByUserIdData_beacon._();

  factory GFetchBeaconsByUserIdData_beacon(
          [Function(GFetchBeaconsByUserIdData_beaconBuilder b) updates]) =
      _$GFetchBeaconsByUserIdData_beacon;

  static void _initializeBuilder(GFetchBeaconsByUserIdData_beaconBuilder b) =>
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
  bool get enabled;
  @override
  GFetchBeaconsByUserIdData_beacon_author get author;
  GFetchBeaconsByUserIdData_beacon_comments_aggregate get comments_aggregate;
  static Serializer<GFetchBeaconsByUserIdData_beacon> get serializer =>
      _$gFetchBeaconsByUserIdDataBeaconSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchBeaconsByUserIdData_beacon.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchBeaconsByUserIdData_beacon? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchBeaconsByUserIdData_beacon.serializer,
        json,
      );
}

abstract class GFetchBeaconsByUserIdData_beacon_author
    implements
        Built<GFetchBeaconsByUserIdData_beacon_author,
            GFetchBeaconsByUserIdData_beacon_authorBuilder>,
        _i2.GbeaconFields_author,
        _i5.GuserFields {
  GFetchBeaconsByUserIdData_beacon_author._();

  factory GFetchBeaconsByUserIdData_beacon_author(
      [Function(GFetchBeaconsByUserIdData_beacon_authorBuilder b)
          updates]) = _$GFetchBeaconsByUserIdData_beacon_author;

  static void _initializeBuilder(
          GFetchBeaconsByUserIdData_beacon_authorBuilder b) =>
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
  static Serializer<GFetchBeaconsByUserIdData_beacon_author> get serializer =>
      _$gFetchBeaconsByUserIdDataBeaconAuthorSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchBeaconsByUserIdData_beacon_author.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchBeaconsByUserIdData_beacon_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchBeaconsByUserIdData_beacon_author.serializer,
        json,
      );
}

abstract class GFetchBeaconsByUserIdData_beacon_comments_aggregate
    implements
        Built<GFetchBeaconsByUserIdData_beacon_comments_aggregate,
            GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder> {
  GFetchBeaconsByUserIdData_beacon_comments_aggregate._();

  factory GFetchBeaconsByUserIdData_beacon_comments_aggregate(
      [Function(GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder b)
          updates]) = _$GFetchBeaconsByUserIdData_beacon_comments_aggregate;

  static void _initializeBuilder(
          GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder b) =>
      b..G__typename = 'comment_aggregate';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate? get aggregate;
  static Serializer<GFetchBeaconsByUserIdData_beacon_comments_aggregate>
      get serializer =>
          _$gFetchBeaconsByUserIdDataBeaconCommentsAggregateSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchBeaconsByUserIdData_beacon_comments_aggregate.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchBeaconsByUserIdData_beacon_comments_aggregate? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchBeaconsByUserIdData_beacon_comments_aggregate.serializer,
        json,
      );
}

abstract class GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate
    implements
        Built<GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate,
            GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder> {
  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate._();

  factory GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate(
          [Function(
                  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder
                      b)
              updates]) =
      _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate;

  static void _initializeBuilder(
          GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder
              b) =>
      b..G__typename = 'comment_aggregate_fields';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get count;
  static Serializer<
          GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate>
      get serializer =>
          _$gFetchBeaconsByUserIdDataBeaconCommentsAggregateAggregateSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate
            .serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate
                .serializer,
            json,
          );
}
