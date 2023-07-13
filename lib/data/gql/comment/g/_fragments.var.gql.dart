// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;

part '_fragments.var.gql.g.dart';

abstract class GcommentFieldsVars
    implements Built<GcommentFieldsVars, GcommentFieldsVarsBuilder> {
  GcommentFieldsVars._();

  factory GcommentFieldsVars([Function(GcommentFieldsVarsBuilder b) updates]) =
      _$GcommentFieldsVars;

  static Serializer<GcommentFieldsVars> get serializer =>
      _$gcommentFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GcommentFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GcommentFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GcommentFieldsVars.serializer,
        json,
      );
}
