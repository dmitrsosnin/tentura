// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;

part 'fetch_comments_by_beacon_id.var.gql.g.dart';

abstract class GFetchCommentsByBeaconIdVars
    implements
        Built<GFetchCommentsByBeaconIdVars,
            GFetchCommentsByBeaconIdVarsBuilder> {
  GFetchCommentsByBeaconIdVars._();

  factory GFetchCommentsByBeaconIdVars(
          [Function(GFetchCommentsByBeaconIdVarsBuilder b) updates]) =
      _$GFetchCommentsByBeaconIdVars;

  String get beacon_id;
  static Serializer<GFetchCommentsByBeaconIdVars> get serializer =>
      _$gFetchCommentsByBeaconIdVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchCommentsByBeaconIdVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchCommentsByBeaconIdVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchCommentsByBeaconIdVars.serializer,
        json,
      );
}
