// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:flutter/material.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:gravity/data/gql/_g/schema.schema.gql.dart'
    show
        GBoolean_comparison_exp,
        GInt_comparison_exp,
        GString_comparison_exp,
        Gbeacon_bool_exp,
        Gbeacon_constraint,
        Gbeacon_inc_input,
        Gbeacon_insert_input,
        Gbeacon_on_conflict,
        Gbeacon_order_by,
        Gbeacon_pk_columns_input,
        Gbeacon_select_column,
        Gbeacon_set_input,
        Gbeacon_stream_cursor_input,
        Gbeacon_stream_cursor_value_input,
        Gbeacon_update_column,
        Gbeacon_updates,
        Gcomment_aggregate_bool_exp,
        Gcomment_aggregate_bool_exp_count,
        Gcomment_aggregate_order_by,
        Gcomment_arr_rel_insert_input,
        Gcomment_bool_exp,
        Gcomment_constraint,
        Gcomment_insert_input,
        Gcomment_max_order_by,
        Gcomment_min_order_by,
        Gcomment_on_conflict,
        Gcomment_order_by,
        Gcomment_pk_columns_input,
        Gcomment_select_column,
        Gcomment_set_input,
        Gcomment_stream_cursor_input,
        Gcomment_stream_cursor_value_input,
        Gcomment_update_column,
        Gcomment_updates,
        Gcursor_ordering,
        Ggeography_cast_exp,
        Ggeography_comparison_exp,
        Ggeometry,
        Ggeometry_cast_exp,
        Ggeometry_comparison_exp,
        Gorder_by,
        Gst_d_within_geography_input,
        Gst_d_within_input,
        Gtimestamptz_comparison_exp,
        Gtstzrange_comparison_exp,
        Guser_bool_exp,
        Guser_constraint,
        Guser_insert_input,
        Guser_obj_rel_insert_input,
        Guser_on_conflict,
        Guser_order_by,
        Guser_pk_columns_input,
        Guser_select_column,
        Guser_set_input,
        Guser_stream_cursor_input,
        Guser_stream_cursor_value_input,
        Guser_update_column,
        Guser_updates,
        Gvote_beacon_bool_exp,
        Gvote_beacon_constraint,
        Gvote_beacon_inc_input,
        Gvote_beacon_insert_input,
        Gvote_beacon_on_conflict,
        Gvote_beacon_order_by,
        Gvote_beacon_pk_columns_input,
        Gvote_beacon_select_column,
        Gvote_beacon_set_input,
        Gvote_beacon_stream_cursor_input,
        Gvote_beacon_stream_cursor_value_input,
        Gvote_beacon_update_column,
        Gvote_beacon_updates,
        Gvote_comment_bool_exp,
        Gvote_comment_constraint,
        Gvote_comment_inc_input,
        Gvote_comment_insert_input,
        Gvote_comment_on_conflict,
        Gvote_comment_order_by,
        Gvote_comment_pk_columns_input,
        Gvote_comment_select_column,
        Gvote_comment_set_input,
        Gvote_comment_stream_cursor_input,
        Gvote_comment_stream_cursor_value_input,
        Gvote_comment_update_column,
        Gvote_comment_updates,
        Gvote_user_bool_exp,
        Gvote_user_constraint,
        Gvote_user_inc_input,
        Gvote_user_insert_input,
        Gvote_user_on_conflict,
        Gvote_user_order_by,
        Gvote_user_pk_columns_input,
        Gvote_user_select_column,
        Gvote_user_set_input,
        Gvote_user_stream_cursor_input,
        Gvote_user_stream_cursor_value_input,
        Gvote_user_update_column,
        Gvote_user_updates;
import 'package:gravity/data/gql/beacon/_g/_fragments.data.gql.dart'
    show GbeaconFieldsData, GbeaconFieldsData_author;
import 'package:gravity/data/gql/beacon/_g/_fragments.req.gql.dart'
    show GbeaconFieldsReq;
import 'package:gravity/data/gql/beacon/_g/_fragments.var.gql.dart'
    show GbeaconFieldsVars;
import 'package:gravity/data/gql/beacon/_g/create_beacon.data.gql.dart'
    show
        GCreateBeaconData,
        GCreateBeaconData_insert_beacon_one,
        GCreateBeaconData_insert_beacon_one_author;
import 'package:gravity/data/gql/beacon/_g/create_beacon.req.gql.dart'
    show GCreateBeaconReq;
import 'package:gravity/data/gql/beacon/_g/create_beacon.var.gql.dart'
    show GCreateBeaconVars;
import 'package:gravity/data/gql/beacon/_g/fetch_beacon_by_user_id.data.gql.dart'
    show
        GFetchBeaconsByUserIdData,
        GFetchBeaconsByUserIdData_beacon,
        GFetchBeaconsByUserIdData_beacon_author,
        GFetchBeaconsByUserIdData_beacon_comments_aggregate,
        GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate;
import 'package:gravity/data/gql/beacon/_g/fetch_beacon_by_user_id.req.gql.dart'
    show GFetchBeaconsByUserIdReq;
import 'package:gravity/data/gql/beacon/_g/fetch_beacon_by_user_id.var.gql.dart'
    show GFetchBeaconsByUserIdVars;
import 'package:gravity/data/gql/beacon/_g/search_beacon.data.gql.dart'
    show
        GSearchBeaconData,
        GSearchBeaconData_beacon,
        GSearchBeaconData_beacon_author;
import 'package:gravity/data/gql/beacon/_g/search_beacon.req.gql.dart'
    show GSearchBeaconReq;
import 'package:gravity/data/gql/beacon/_g/search_beacon.var.gql.dart'
    show GSearchBeaconVars;
import 'package:gravity/data/gql/comment/_g/_fragments.data.gql.dart'
    show GcommentFieldsData;
import 'package:gravity/data/gql/comment/_g/_fragments.req.gql.dart'
    show GcommentFieldsReq;
import 'package:gravity/data/gql/comment/_g/_fragments.var.gql.dart'
    show GcommentFieldsVars;
import 'package:gravity/data/gql/comment/_g/fetch_comments_by_beacon_id.data.gql.dart'
    show
        GFetchCommentsByBeaconIdData,
        GFetchCommentsByBeaconIdData_comment,
        GFetchCommentsByBeaconIdData_comment_author;
import 'package:gravity/data/gql/comment/_g/fetch_comments_by_beacon_id.req.gql.dart'
    show GFetchCommentsByBeaconIdReq;
import 'package:gravity/data/gql/comment/_g/fetch_comments_by_beacon_id.var.gql.dart'
    show GFetchCommentsByBeaconIdVars;
import 'package:gravity/data/gql/geography_serializer.dart'
    show GeographySerializer;
import 'package:gravity/data/gql/timestamptz_serializer.dart'
    show TimestamptzSerializer;
import 'package:gravity/data/gql/tstzrange_serializer.dart'
    show TstzrangeSerializer;
import 'package:gravity/data/gql/user/_g/_fragments.data.gql.dart'
    show GuserFieldsData;
import 'package:gravity/data/gql/user/_g/_fragments.req.gql.dart'
    show GuserFieldsReq;
import 'package:gravity/data/gql/user/_g/_fragments.var.gql.dart'
    show GuserFieldsVars;
import 'package:gravity/data/gql/user/_g/create_user.data.gql.dart'
    show GCreateUserData, GCreateUserData_insert_user_one;
import 'package:gravity/data/gql/user/_g/create_user.req.gql.dart'
    show GCreateUserReq;
import 'package:gravity/data/gql/user/_g/create_user.var.gql.dart'
    show GCreateUserVars;
import 'package:gravity/data/gql/user/_g/fetch_user_profile.data.gql.dart'
    show GFetchUserProfileData, GFetchUserProfileData_user_by_pk;
import 'package:gravity/data/gql/user/_g/fetch_user_profile.req.gql.dart'
    show GFetchUserProfileReq;
import 'package:gravity/data/gql/user/_g/fetch_user_profile.var.gql.dart'
    show GFetchUserProfileVars;
import 'package:gravity/data/gql/user/_g/update_user.data.gql.dart'
    show GUpdateUserData, GUpdateUserData_update_user_by_pk;
import 'package:gravity/data/gql/user/_g/update_user.req.gql.dart'
    show GUpdateUserReq;
import 'package:gravity/data/gql/user/_g/update_user.var.gql.dart'
    show GUpdateUserVars;
import 'package:latlong2/latlong.dart';

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(TimestamptzSerializer())
  ..add(TstzrangeSerializer())
  ..add(GeographySerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GBoolean_comparison_exp,
  GCreateBeaconData,
  GCreateBeaconData_insert_beacon_one,
  GCreateBeaconData_insert_beacon_one_author,
  GCreateBeaconReq,
  GCreateBeaconVars,
  GCreateUserData,
  GCreateUserData_insert_user_one,
  GCreateUserReq,
  GCreateUserVars,
  GFetchBeaconsByUserIdData,
  GFetchBeaconsByUserIdData_beacon,
  GFetchBeaconsByUserIdData_beacon_author,
  GFetchBeaconsByUserIdData_beacon_comments_aggregate,
  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate,
  GFetchBeaconsByUserIdReq,
  GFetchBeaconsByUserIdVars,
  GFetchCommentsByBeaconIdData,
  GFetchCommentsByBeaconIdData_comment,
  GFetchCommentsByBeaconIdData_comment_author,
  GFetchCommentsByBeaconIdReq,
  GFetchCommentsByBeaconIdVars,
  GFetchUserProfileData,
  GFetchUserProfileData_user_by_pk,
  GFetchUserProfileReq,
  GFetchUserProfileVars,
  GInt_comparison_exp,
  GSearchBeaconData,
  GSearchBeaconData_beacon,
  GSearchBeaconData_beacon_author,
  GSearchBeaconReq,
  GSearchBeaconVars,
  GString_comparison_exp,
  GUpdateUserData,
  GUpdateUserData_update_user_by_pk,
  GUpdateUserReq,
  GUpdateUserVars,
  GbeaconFieldsData,
  GbeaconFieldsData_author,
  GbeaconFieldsReq,
  GbeaconFieldsVars,
  Gbeacon_bool_exp,
  Gbeacon_constraint,
  Gbeacon_inc_input,
  Gbeacon_insert_input,
  Gbeacon_on_conflict,
  Gbeacon_order_by,
  Gbeacon_pk_columns_input,
  Gbeacon_select_column,
  Gbeacon_set_input,
  Gbeacon_stream_cursor_input,
  Gbeacon_stream_cursor_value_input,
  Gbeacon_update_column,
  Gbeacon_updates,
  GcommentFieldsData,
  GcommentFieldsReq,
  GcommentFieldsVars,
  Gcomment_aggregate_bool_exp,
  Gcomment_aggregate_bool_exp_count,
  Gcomment_aggregate_order_by,
  Gcomment_arr_rel_insert_input,
  Gcomment_bool_exp,
  Gcomment_constraint,
  Gcomment_insert_input,
  Gcomment_max_order_by,
  Gcomment_min_order_by,
  Gcomment_on_conflict,
  Gcomment_order_by,
  Gcomment_pk_columns_input,
  Gcomment_select_column,
  Gcomment_set_input,
  Gcomment_stream_cursor_input,
  Gcomment_stream_cursor_value_input,
  Gcomment_update_column,
  Gcomment_updates,
  Gcursor_ordering,
  Ggeography_cast_exp,
  Ggeography_comparison_exp,
  Ggeometry,
  Ggeometry_cast_exp,
  Ggeometry_comparison_exp,
  Gorder_by,
  Gst_d_within_geography_input,
  Gst_d_within_input,
  Gtimestamptz_comparison_exp,
  Gtstzrange_comparison_exp,
  GuserFieldsData,
  GuserFieldsReq,
  GuserFieldsVars,
  Guser_bool_exp,
  Guser_constraint,
  Guser_insert_input,
  Guser_obj_rel_insert_input,
  Guser_on_conflict,
  Guser_order_by,
  Guser_pk_columns_input,
  Guser_select_column,
  Guser_set_input,
  Guser_stream_cursor_input,
  Guser_stream_cursor_value_input,
  Guser_update_column,
  Guser_updates,
  Gvote_beacon_bool_exp,
  Gvote_beacon_constraint,
  Gvote_beacon_inc_input,
  Gvote_beacon_insert_input,
  Gvote_beacon_on_conflict,
  Gvote_beacon_order_by,
  Gvote_beacon_pk_columns_input,
  Gvote_beacon_select_column,
  Gvote_beacon_set_input,
  Gvote_beacon_stream_cursor_input,
  Gvote_beacon_stream_cursor_value_input,
  Gvote_beacon_update_column,
  Gvote_beacon_updates,
  Gvote_comment_bool_exp,
  Gvote_comment_constraint,
  Gvote_comment_inc_input,
  Gvote_comment_insert_input,
  Gvote_comment_on_conflict,
  Gvote_comment_order_by,
  Gvote_comment_pk_columns_input,
  Gvote_comment_select_column,
  Gvote_comment_set_input,
  Gvote_comment_stream_cursor_input,
  Gvote_comment_stream_cursor_value_input,
  Gvote_comment_update_column,
  Gvote_comment_updates,
  Gvote_user_bool_exp,
  Gvote_user_constraint,
  Gvote_user_inc_input,
  Gvote_user_insert_input,
  Gvote_user_on_conflict,
  Gvote_user_order_by,
  Gvote_user_pk_columns_input,
  Gvote_user_select_column,
  Gvote_user_set_input,
  Gvote_user_stream_cursor_input,
  Gvote_user_stream_cursor_value_input,
  Gvote_user_update_column,
  Gvote_user_updates,
])
final Serializers serializers = _serializersBuilder.build();
