// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/_g/serializers.gql.dart' as _i1;
import 'package:gravity/data/gql/user/_g/_fragments.data.gql.dart' as _i2;

part 'create_user.data.gql.g.dart';

abstract class GCreateUserData
    implements Built<GCreateUserData, GCreateUserDataBuilder> {
  GCreateUserData._();

  factory GCreateUserData([Function(GCreateUserDataBuilder b) updates]) =
      _$GCreateUserData;

  static void _initializeBuilder(GCreateUserDataBuilder b) =>
      b..G__typename = 'mutation_root';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateUserData_insert_user_one? get insert_user_one;
  static Serializer<GCreateUserData> get serializer =>
      _$gCreateUserDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserData.serializer,
        json,
      );
}

abstract class GCreateUserData_insert_user_one
    implements
        Built<GCreateUserData_insert_user_one,
            GCreateUserData_insert_user_oneBuilder>,
        _i2.GuserFields {
  GCreateUserData_insert_user_one._();

  factory GCreateUserData_insert_user_one(
          [Function(GCreateUserData_insert_user_oneBuilder b) updates]) =
      _$GCreateUserData_insert_user_one;

  static void _initializeBuilder(GCreateUserData_insert_user_oneBuilder b) =>
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
  static Serializer<GCreateUserData_insert_user_one> get serializer =>
      _$gCreateUserDataInsertUserOneSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserData_insert_user_one.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateUserData_insert_user_one? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserData_insert_user_one.serializer,
        json,
      );
}
