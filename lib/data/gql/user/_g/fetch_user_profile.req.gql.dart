// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gravity/data/gql/_g/serializers.gql.dart' as _i6;
import 'package:gravity/data/gql/user/_g/fetch_user_profile.ast.gql.dart'
    as _i5;
import 'package:gravity/data/gql/user/_g/fetch_user_profile.data.gql.dart'
    as _i2;
import 'package:gravity/data/gql/user/_g/fetch_user_profile.var.gql.dart'
    as _i3;

part 'fetch_user_profile.req.gql.g.dart';

abstract class GFetchUserProfileReq
    implements
        Built<GFetchUserProfileReq, GFetchUserProfileReqBuilder>,
        _i1.OperationRequest<_i2.GFetchUserProfileData,
            _i3.GFetchUserProfileVars> {
  GFetchUserProfileReq._();

  factory GFetchUserProfileReq(
          [Function(GFetchUserProfileReqBuilder b) updates]) =
      _$GFetchUserProfileReq;

  static void _initializeBuilder(GFetchUserProfileReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'FetchUserProfile',
    )
    ..executeOnListen = true;
  @override
  _i3.GFetchUserProfileVars get vars;
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
  _i2.GFetchUserProfileData? Function(
    _i2.GFetchUserProfileData?,
    _i2.GFetchUserProfileData?,
  )? get updateResult;
  @override
  _i2.GFetchUserProfileData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GFetchUserProfileData? parseData(Map<String, dynamic> json) =>
      _i2.GFetchUserProfileData.fromJson(json);
  static Serializer<GFetchUserProfileReq> get serializer =>
      _$gFetchUserProfileReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFetchUserProfileReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchUserProfileReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFetchUserProfileReq.serializer,
        json,
      );
}
