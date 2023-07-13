// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gravity/data/gql/comment/g/_fragments.data.gql.dart' as _i2;
import 'package:gravity/data/gql/g/schema.schema.gql.dart' as _i3;
import 'package:gravity/data/gql/g/serializers.gql.dart' as _i1;

part 'fetch_comments_by_beacon_id.data.gql.g.dart';

abstract class GFetchCommentsByBeaconIdData
    implements
        Built<GFetchCommentsByBeaconIdData,
            GFetchCommentsByBeaconIdDataBuilder> {
  GFetchCommentsByBeaconIdData._();

  factory GFetchCommentsByBeaconIdData(
          [Function(GFetchCommentsByBeaconIdDataBuilder b) updates]) =
      _$GFetchCommentsByBeaconIdData;

  static void _initializeBuilder(GFetchCommentsByBeaconIdDataBuilder b) =>
      b..G__typename = 'query_root';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GFetchCommentsByBeaconIdData_comment> get comment;
  static Serializer<GFetchCommentsByBeaconIdData> get serializer =>
      _$gFetchCommentsByBeaconIdDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchCommentsByBeaconIdData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchCommentsByBeaconIdData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchCommentsByBeaconIdData.serializer,
        json,
      );
}

abstract class GFetchCommentsByBeaconIdData_comment
    implements
        Built<GFetchCommentsByBeaconIdData_comment,
            GFetchCommentsByBeaconIdData_commentBuilder>,
        _i2.GcommentFields {
  GFetchCommentsByBeaconIdData_comment._();

  factory GFetchCommentsByBeaconIdData_comment(
          [Function(GFetchCommentsByBeaconIdData_commentBuilder b) updates]) =
      _$GFetchCommentsByBeaconIdData_comment;

  static void _initializeBuilder(
          GFetchCommentsByBeaconIdData_commentBuilder b) =>
      b..G__typename = 'comment';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  _i3.Guuid get id;
  @override
  String get user_id;
  @override
  String get beacon_id;
  @override
  _i3.Gtimestamptz get created_at;
  @override
  String get content;
  GFetchCommentsByBeaconIdData_comment_author get author;
  static Serializer<GFetchCommentsByBeaconIdData_comment> get serializer =>
      _$gFetchCommentsByBeaconIdDataCommentSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchCommentsByBeaconIdData_comment.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchCommentsByBeaconIdData_comment? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchCommentsByBeaconIdData_comment.serializer,
        json,
      );
}

abstract class GFetchCommentsByBeaconIdData_comment_author
    implements
        Built<GFetchCommentsByBeaconIdData_comment_author,
            GFetchCommentsByBeaconIdData_comment_authorBuilder> {
  GFetchCommentsByBeaconIdData_comment_author._();

  factory GFetchCommentsByBeaconIdData_comment_author(
      [Function(GFetchCommentsByBeaconIdData_comment_authorBuilder b)
          updates]) = _$GFetchCommentsByBeaconIdData_comment_author;

  static void _initializeBuilder(
          GFetchCommentsByBeaconIdData_comment_authorBuilder b) =>
      b..G__typename = 'user';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get title;
  bool get has_picture;
  static Serializer<GFetchCommentsByBeaconIdData_comment_author>
      get serializer => _$gFetchCommentsByBeaconIdDataCommentAuthorSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFetchCommentsByBeaconIdData_comment_author.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFetchCommentsByBeaconIdData_comment_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFetchCommentsByBeaconIdData_comment_author.serializer,
        json,
      );
}
