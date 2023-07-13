// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;
import 'package:gravity/data/gql/user/g/_fragments.data.gql.dart' as _i2;

part 'update_user.data.gql.g.dart';

abstract class GUpdateUserData
    implements Built<GUpdateUserData, GUpdateUserDataBuilder> {
  GUpdateUserData._();

  factory GUpdateUserData([Function(GUpdateUserDataBuilder b) updates]) =
      _$GUpdateUserData;

  static void _initializeBuilder(GUpdateUserDataBuilder b) =>
      b..G__typename = 'mutation_root';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUpdateUserData_update_user_by_pk? get update_user_by_pk;
  static Serializer<GUpdateUserData> get serializer =>
      _$gUpdateUserDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserData.serializer,
        json,
      );
}

abstract class GUpdateUserData_update_user_by_pk
    implements
        Built<GUpdateUserData_update_user_by_pk,
            GUpdateUserData_update_user_by_pkBuilder>,
        _i2.GuserFields {
  GUpdateUserData_update_user_by_pk._();

  factory GUpdateUserData_update_user_by_pk(
          [Function(GUpdateUserData_update_user_by_pkBuilder b) updates]) =
      _$GUpdateUserData_update_user_by_pk;

  static void _initializeBuilder(GUpdateUserData_update_user_by_pkBuilder b) =>
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
  static Serializer<GUpdateUserData_update_user_by_pk> get serializer =>
      _$gUpdateUserDataUpdateUserByPkSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserData_update_user_by_pk.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateUserData_update_user_by_pk? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserData_update_user_by_pk.serializer,
        json,
      );
}
