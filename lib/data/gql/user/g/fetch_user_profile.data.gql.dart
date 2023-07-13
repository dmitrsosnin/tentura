// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;
import 'package:gravity/data/gql/user/g/_fragments.data.gql.dart' as _i2;

part 'fetch_user_profile.data.gql.g.dart';

abstract class GFetchUserProfileData
    implements Built<GFetchUserProfileData, GFetchUserProfileDataBuilder> {
  GFetchUserProfileData._();

  factory GFetchUserProfileData(
          [Function(GFetchUserProfileDataBuilder b) updates]) =
      _$GFetchUserProfileData;

  static void _initializeBuilder(GFetchUserProfileDataBuilder b) =>
      b..G__typename = 'query_root';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFetchUserProfileData_user_by_pk? get user_by_pk;
  static Serializer<GFetchUserProfileData> get serializer =>
      _$gFetchUserProfileDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchUserProfileData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchUserProfileData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchUserProfileData.serializer,
        json,
      );
}

abstract class GFetchUserProfileData_user_by_pk
    implements
        Built<GFetchUserProfileData_user_by_pk,
            GFetchUserProfileData_user_by_pkBuilder>,
        _i2.GuserFields {
  GFetchUserProfileData_user_by_pk._();

  factory GFetchUserProfileData_user_by_pk(
          [Function(GFetchUserProfileData_user_by_pkBuilder b) updates]) =
      _$GFetchUserProfileData_user_by_pk;

  static void _initializeBuilder(GFetchUserProfileData_user_by_pkBuilder b) =>
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
  static Serializer<GFetchUserProfileData_user_by_pk> get serializer =>
      _$gFetchUserProfileDataUserByPkSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchUserProfileData_user_by_pk.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchUserProfileData_user_by_pk? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchUserProfileData_user_by_pk.serializer,
        json,
      );
}
