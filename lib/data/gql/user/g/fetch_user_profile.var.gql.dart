// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;

part 'fetch_user_profile.var.gql.g.dart';

abstract class GFetchUserProfileVars
    implements Built<GFetchUserProfileVars, GFetchUserProfileVarsBuilder> {
  GFetchUserProfileVars._();

  factory GFetchUserProfileVars(
          [Function(GFetchUserProfileVarsBuilder b) updates]) =
      _$GFetchUserProfileVars;

  String get id;
  static Serializer<GFetchUserProfileVars> get serializer =>
      _$gFetchUserProfileVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchUserProfileVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchUserProfileVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchUserProfileVars.serializer,
        json,
      );
}
