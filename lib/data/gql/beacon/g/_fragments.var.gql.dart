// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;

part '_fragments.var.gql.g.dart';

abstract class GbeaconFieldsVars
    implements Built<GbeaconFieldsVars, GbeaconFieldsVarsBuilder> {
  GbeaconFieldsVars._();

  factory GbeaconFieldsVars([Function(GbeaconFieldsVarsBuilder b) updates]) =
      _$GbeaconFieldsVars;

  static Serializer<GbeaconFieldsVars> get serializer =>
      _$gbeaconFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GbeaconFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GbeaconFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GbeaconFieldsVars.serializer,
        json,
      );
}
