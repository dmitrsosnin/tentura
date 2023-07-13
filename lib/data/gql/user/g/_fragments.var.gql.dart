// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;

part '_fragments.var.gql.g.dart';

abstract class GuserFieldsVars
    implements Built<GuserFieldsVars, GuserFieldsVarsBuilder> {
  GuserFieldsVars._();

  factory GuserFieldsVars([Function(GuserFieldsVarsBuilder b) updates]) =
      _$GuserFieldsVars;

  static Serializer<GuserFieldsVars> get serializer =>
      _$guserFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GuserFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GuserFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GuserFieldsVars.serializer,
        json,
      );
}
