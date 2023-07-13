// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gravity/data/gql/comment/g/fetch_comments_by_beacon_id.ast.gql.dart'
    as _i5;
import 'package:gravity/data/gql/comment/g/fetch_comments_by_beacon_id.data.gql.dart'
    as _i2;
import 'package:gravity/data/gql/comment/g/fetch_comments_by_beacon_id.var.gql.dart'
    as _i3;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i6;

part 'fetch_comments_by_beacon_id.req.gql.g.dart';

abstract class GFetchCommentsByBeaconIdReq
    implements
        Built<GFetchCommentsByBeaconIdReq, GFetchCommentsByBeaconIdReqBuilder>,
        _i1.OperationRequest<_i2.GFetchCommentsByBeaconIdData,
            _i3.GFetchCommentsByBeaconIdVars> {
  GFetchCommentsByBeaconIdReq._();

  factory GFetchCommentsByBeaconIdReq(
          [Function(GFetchCommentsByBeaconIdReqBuilder b) updates]) =
      _$GFetchCommentsByBeaconIdReq;

  static void _initializeBuilder(GFetchCommentsByBeaconIdReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'FetchCommentsByBeaconId',
    )
    ..executeOnListen = true;
  @override
  _i3.GFetchCommentsByBeaconIdVars get vars;
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
  _i2.GFetchCommentsByBeaconIdData? Function(
    _i2.GFetchCommentsByBeaconIdData?,
    _i2.GFetchCommentsByBeaconIdData?,
  )? get updateResult;
  @override
  _i2.GFetchCommentsByBeaconIdData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GFetchCommentsByBeaconIdData? parseData(Map<String, dynamic> json) =>
      _i2.GFetchCommentsByBeaconIdData.fromJson(json);
  static Serializer<GFetchCommentsByBeaconIdReq> get serializer =>
      _$gFetchCommentsByBeaconIdReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFetchCommentsByBeaconIdReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchCommentsByBeaconIdReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFetchCommentsByBeaconIdReq.serializer,
        json,
      );
}
