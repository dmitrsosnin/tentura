// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/_g/serializers.gql.dart' as _i1;

part '_fragments.data.gql.g.dart';

abstract class GuserFields {
  String get G__typename;
  String get id;
  String get title;
  String get description;
  bool get has_picture;
  Map<String, dynamic> toJson();
}

abstract class GuserFieldsData
    implements Built<GuserFieldsData, GuserFieldsDataBuilder>, GuserFields {
  GuserFieldsData._();

  factory GuserFieldsData([Function(GuserFieldsDataBuilder b) updates]) =
      _$GuserFieldsData;

  static void _initializeBuilder(GuserFieldsDataBuilder b) =>
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
  static Serializer<GuserFieldsData> get serializer =>
      _$guserFieldsDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GuserFieldsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GuserFieldsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GuserFieldsData.serializer,
        json,
      );
}
