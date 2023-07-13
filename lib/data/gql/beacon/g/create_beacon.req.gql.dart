// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gravity/data/gql/beacon/g/create_beacon.ast.gql.dart' as _i5;
import 'package:gravity/data/gql/beacon/g/create_beacon.data.gql.dart' as _i2;
import 'package:gravity/data/gql/beacon/g/create_beacon.var.gql.dart' as _i3;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i6;

part 'create_beacon.req.gql.g.dart';

abstract class GCreateBeaconReq
    implements
        Built<GCreateBeaconReq, GCreateBeaconReqBuilder>,
        _i1.OperationRequest<_i2.GCreateBeaconData, _i3.GCreateBeaconVars> {
  GCreateBeaconReq._();

  factory GCreateBeaconReq([Function(GCreateBeaconReqBuilder b) updates]) =
      _$GCreateBeaconReq;

  static void _initializeBuilder(GCreateBeaconReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateBeacon',
    )
    ..executeOnListen = true;
  @override
  _i3.GCreateBeaconVars get vars;
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
  _i2.GCreateBeaconData? Function(
    _i2.GCreateBeaconData?,
    _i2.GCreateBeaconData?,
  )? get updateResult;
  @override
  _i2.GCreateBeaconData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateBeaconData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateBeaconData.fromJson(json);
  static Serializer<GCreateBeaconReq> get serializer =>
      _$gCreateBeaconReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateBeaconReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateBeaconReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateBeaconReq.serializer,
        json,
      );
}
