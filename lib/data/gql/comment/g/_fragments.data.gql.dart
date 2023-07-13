// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/schema.schema.gql.dart' as _i1;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i2;

part '_fragments.data.gql.g.dart';

abstract class GcommentFields {
  String get G__typename;
  _i1.Guuid get id;
  String get user_id;
  String get beacon_id;
  _i1.Gtimestamptz get created_at;
  String get content;
  Map<String, dynamic> toJson();
}

abstract class GcommentFieldsData
    implements
        Built<GcommentFieldsData, GcommentFieldsDataBuilder>,
        GcommentFields {
  GcommentFieldsData._();

  factory GcommentFieldsData([Function(GcommentFieldsDataBuilder b) updates]) =
      _$GcommentFieldsData;

  static void _initializeBuilder(GcommentFieldsDataBuilder b) =>
      b..G__typename = 'comment';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  _i1.Guuid get id;
  @override
  String get user_id;
  @override
  String get beacon_id;
  @override
  _i1.Gtimestamptz get created_at;
  @override
  String get content;
  static Serializer<GcommentFieldsData> get serializer =>
      _$gcommentFieldsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GcommentFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GcommentFieldsData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GcommentFieldsData.serializer,
        json,
      );
}
