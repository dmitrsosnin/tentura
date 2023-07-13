// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i6;
import 'package:gravity/data/gql/user/g/_fragments.ast.gql.dart' as _i4;
import 'package:gravity/data/gql/user/g/_fragments.data.gql.dart' as _i2;
import 'package:gravity/data/gql/user/g/_fragments.var.gql.dart' as _i3;

part '_fragments.req.gql.g.dart';

abstract class GuserFieldsReq
    implements
        Built<GuserFieldsReq, GuserFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GuserFieldsData, _i3.GuserFieldsVars> {
  GuserFieldsReq._();

  factory GuserFieldsReq([Function(GuserFieldsReqBuilder b) updates]) =
      _$GuserFieldsReq;

  static void _initializeBuilder(GuserFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'userFields';
  @override
  _i3.GuserFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GuserFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GuserFieldsData.fromJson(json);
  static Serializer<GuserFieldsReq> get serializer =>
      _$guserFieldsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GuserFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GuserFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GuserFieldsReq.serializer,
        json,
      );
}
