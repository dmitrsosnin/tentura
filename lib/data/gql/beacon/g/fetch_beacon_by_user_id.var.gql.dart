// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;

part 'fetch_beacon_by_user_id.var.gql.g.dart';

abstract class GFetchBeaconsByUserIdVars
    implements
        Built<GFetchBeaconsByUserIdVars, GFetchBeaconsByUserIdVarsBuilder> {
  GFetchBeaconsByUserIdVars._();

  factory GFetchBeaconsByUserIdVars(
          [Function(GFetchBeaconsByUserIdVarsBuilder b) updates]) =
      _$GFetchBeaconsByUserIdVars;

  String get user_id;
  static Serializer<GFetchBeaconsByUserIdVars> get serializer =>
      _$gFetchBeaconsByUserIdVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchBeaconsByUserIdVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchBeaconsByUserIdVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchBeaconsByUserIdVars.serializer,
        json,
      );
}
