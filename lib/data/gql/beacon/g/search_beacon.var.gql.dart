// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;

part 'search_beacon.var.gql.g.dart';

abstract class GSearchBeaconVars
    implements Built<GSearchBeaconVars, GSearchBeaconVarsBuilder> {
  GSearchBeaconVars._();

  factory GSearchBeaconVars([Function(GSearchBeaconVarsBuilder b) updates]) =
      _$GSearchBeaconVars;

  String get startsWith;
  int? get limit;
  static Serializer<GSearchBeaconVars> get serializer =>
      _$gSearchBeaconVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSearchBeaconVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSearchBeaconVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSearchBeaconVars.serializer,
        json,
      );
}
