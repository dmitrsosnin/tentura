// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gravity/data/gql/beacon/g/fetch_beacon_by_user_id.ast.gql.dart'
    as _i5;
import 'package:gravity/data/gql/beacon/g/fetch_beacon_by_user_id.data.gql.dart'
    as _i2;
import 'package:gravity/data/gql/beacon/g/fetch_beacon_by_user_id.var.gql.dart'
    as _i3;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i6;

part 'fetch_beacon_by_user_id.req.gql.g.dart';

abstract class GFetchBeaconsByUserIdReq
    implements
        Built<GFetchBeaconsByUserIdReq, GFetchBeaconsByUserIdReqBuilder>,
        _i1.OperationRequest<_i2.GFetchBeaconsByUserIdData,
            _i3.GFetchBeaconsByUserIdVars> {
  GFetchBeaconsByUserIdReq._();

  factory GFetchBeaconsByUserIdReq(
          [Function(GFetchBeaconsByUserIdReqBuilder b) updates]) =
      _$GFetchBeaconsByUserIdReq;

  static void _initializeBuilder(GFetchBeaconsByUserIdReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'FetchBeaconsByUserId',
    )
    ..executeOnListen = true;
  @override
  _i3.GFetchBeaconsByUserIdVars get vars;
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
  _i2.GFetchBeaconsByUserIdData? Function(
    _i2.GFetchBeaconsByUserIdData?,
    _i2.GFetchBeaconsByUserIdData?,
  )? get updateResult;
  @override
  _i2.GFetchBeaconsByUserIdData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GFetchBeaconsByUserIdData? parseData(Map<String, dynamic> json) =>
      _i2.GFetchBeaconsByUserIdData.fromJson(json);
  static Serializer<GFetchBeaconsByUserIdReq> get serializer =>
      _$gFetchBeaconsByUserIdReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFetchBeaconsByUserIdReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchBeaconsByUserIdReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFetchBeaconsByUserIdReq.serializer,
        json,
      );
}
