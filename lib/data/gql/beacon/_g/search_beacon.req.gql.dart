// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gravity/data/gql/_g/serializers.gql.dart' as _i6;
import 'package:gravity/data/gql/beacon/_g/search_beacon.ast.gql.dart' as _i5;
import 'package:gravity/data/gql/beacon/_g/search_beacon.data.gql.dart' as _i2;
import 'package:gravity/data/gql/beacon/_g/search_beacon.var.gql.dart' as _i3;

part 'search_beacon.req.gql.g.dart';

abstract class GSearchBeaconReq
    implements
        Built<GSearchBeaconReq, GSearchBeaconReqBuilder>,
        _i1.OperationRequest<_i2.GSearchBeaconData, _i3.GSearchBeaconVars> {
  GSearchBeaconReq._();

  factory GSearchBeaconReq([Function(GSearchBeaconReqBuilder b) updates]) =
      _$GSearchBeaconReq;

  static void _initializeBuilder(GSearchBeaconReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'SearchBeacon',
    )
    ..executeOnListen = true;
  @override
  _i3.GSearchBeaconVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GSearchBeaconData? Function(
    _i2.GSearchBeaconData?,
    _i2.GSearchBeaconData?,
  )? get updateResult;
  @override
  _i2.GSearchBeaconData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GSearchBeaconData? parseData(Map<String, dynamic> json) =>
      _i2.GSearchBeaconData.fromJson(json);
  static Serializer<GSearchBeaconReq> get serializer =>
      _$gSearchBeaconReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSearchBeaconReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSearchBeaconReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSearchBeaconReq.serializer,
        json,
      );
}
