// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/schema.schema.gql.dart' as _i1;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i2;

part 'create_beacon.var.gql.g.dart';

abstract class GCreateBeaconVars
    implements Built<GCreateBeaconVars, GCreateBeaconVarsBuilder> {
  GCreateBeaconVars._();

  factory GCreateBeaconVars([Function(GCreateBeaconVarsBuilder b) updates]) =
      _$GCreateBeaconVars;

  String get title;
  String get description;
  _i1.Ggeography? get place;
  _i1.Gtstzrange? get timerange;
  bool get has_picture;
  static Serializer<GCreateBeaconVars> get serializer =>
      _$gCreateBeaconVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateBeaconVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateBeaconVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateBeaconVars.serializer,
        json,
      );
}
