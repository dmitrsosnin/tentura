// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:gravity/data/gql/beacon/g/_fragments.ast.gql.dart' as _i4;
import 'package:gravity/data/gql/beacon/g/_fragments.data.gql.dart' as _i2;
import 'package:gravity/data/gql/beacon/g/_fragments.var.gql.dart' as _i3;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i6;

part '_fragments.req.gql.g.dart';

abstract class GbeaconFieldsReq
    implements
        Built<GbeaconFieldsReq, GbeaconFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GbeaconFieldsData, _i3.GbeaconFieldsVars> {
  GbeaconFieldsReq._();

  factory GbeaconFieldsReq([Function(GbeaconFieldsReqBuilder b) updates]) =
      _$GbeaconFieldsReq;

  static void _initializeBuilder(GbeaconFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'beaconFields';
  @override
  _i3.GbeaconFieldsVars get vars;
  @override
  _i5.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GbeaconFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GbeaconFieldsData.fromJson(json);
  static Serializer<GbeaconFieldsReq> get serializer =>
      _$gbeaconFieldsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GbeaconFieldsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GbeaconFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GbeaconFieldsReq.serializer,
        json,
      );
}
