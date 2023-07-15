// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GBoolean_comparison_exp.serializer)
      ..add(GCreateBeaconData.serializer)
      ..add(GCreateBeaconData_insert_beacon_one.serializer)
      ..add(GCreateBeaconData_insert_beacon_one_author.serializer)
      ..add(GCreateBeaconReq.serializer)
      ..add(GCreateBeaconVars.serializer)
      ..add(GCreateUserData.serializer)
      ..add(GCreateUserData_insert_user_one.serializer)
      ..add(GCreateUserReq.serializer)
      ..add(GCreateUserVars.serializer)
      ..add(GFetchBeaconsByUserIdData.serializer)
      ..add(GFetchBeaconsByUserIdData_beacon.serializer)
      ..add(GFetchBeaconsByUserIdData_beacon_author.serializer)
      ..add(GFetchBeaconsByUserIdData_beacon_comments_aggregate.serializer)
      ..add(GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate
          .serializer)
      ..add(GFetchBeaconsByUserIdReq.serializer)
      ..add(GFetchBeaconsByUserIdVars.serializer)
      ..add(GFetchCommentsByBeaconIdData.serializer)
      ..add(GFetchCommentsByBeaconIdData_comment.serializer)
      ..add(GFetchCommentsByBeaconIdData_comment_author.serializer)
      ..add(GFetchCommentsByBeaconIdReq.serializer)
      ..add(GFetchCommentsByBeaconIdVars.serializer)
      ..add(GFetchUserProfileData.serializer)
      ..add(GFetchUserProfileData_user_by_pk.serializer)
      ..add(GFetchUserProfileReq.serializer)
      ..add(GFetchUserProfileVars.serializer)
      ..add(GInt_comparison_exp.serializer)
      ..add(GSearchBeaconData.serializer)
      ..add(GSearchBeaconData_beacon.serializer)
      ..add(GSearchBeaconData_beacon_author.serializer)
      ..add(GSearchBeaconReq.serializer)
      ..add(GSearchBeaconVars.serializer)
      ..add(GString_comparison_exp.serializer)
      ..add(GUpdateUserData.serializer)
      ..add(GUpdateUserData_update_user_by_pk.serializer)
      ..add(GUpdateUserReq.serializer)
      ..add(GUpdateUserVars.serializer)
      ..add(GbeaconFieldsData.serializer)
      ..add(GbeaconFieldsData_author.serializer)
      ..add(GbeaconFieldsReq.serializer)
      ..add(GbeaconFieldsVars.serializer)
      ..add(Gbeacon_bool_exp.serializer)
      ..add(Gbeacon_constraint.serializer)
      ..add(Gbeacon_inc_input.serializer)
      ..add(Gbeacon_insert_input.serializer)
      ..add(Gbeacon_on_conflict.serializer)
      ..add(Gbeacon_order_by.serializer)
      ..add(Gbeacon_pk_columns_input.serializer)
      ..add(Gbeacon_select_column.serializer)
      ..add(Gbeacon_set_input.serializer)
      ..add(Gbeacon_stream_cursor_input.serializer)
      ..add(Gbeacon_stream_cursor_value_input.serializer)
      ..add(Gbeacon_update_column.serializer)
      ..add(Gbeacon_updates.serializer)
      ..add(GcommentFieldsData.serializer)
      ..add(GcommentFieldsReq.serializer)
      ..add(GcommentFieldsVars.serializer)
      ..add(Gcomment_aggregate_bool_exp.serializer)
      ..add(Gcomment_aggregate_bool_exp_count.serializer)
      ..add(Gcomment_aggregate_order_by.serializer)
      ..add(Gcomment_arr_rel_insert_input.serializer)
      ..add(Gcomment_bool_exp.serializer)
      ..add(Gcomment_constraint.serializer)
      ..add(Gcomment_insert_input.serializer)
      ..add(Gcomment_max_order_by.serializer)
      ..add(Gcomment_min_order_by.serializer)
      ..add(Gcomment_on_conflict.serializer)
      ..add(Gcomment_order_by.serializer)
      ..add(Gcomment_pk_columns_input.serializer)
      ..add(Gcomment_select_column.serializer)
      ..add(Gcomment_set_input.serializer)
      ..add(Gcomment_stream_cursor_input.serializer)
      ..add(Gcomment_stream_cursor_value_input.serializer)
      ..add(Gcomment_update_column.serializer)
      ..add(Gcomment_updates.serializer)
      ..add(Gcursor_ordering.serializer)
      ..add(Ggeography_cast_exp.serializer)
      ..add(Ggeography_comparison_exp.serializer)
      ..add(Ggeometry.serializer)
      ..add(Ggeometry_cast_exp.serializer)
      ..add(Ggeometry_comparison_exp.serializer)
      ..add(Gorder_by.serializer)
      ..add(Gst_d_within_geography_input.serializer)
      ..add(Gst_d_within_input.serializer)
      ..add(Gtimestamptz_comparison_exp.serializer)
      ..add(Gtstzrange_comparison_exp.serializer)
      ..add(GuserFieldsData.serializer)
      ..add(GuserFieldsReq.serializer)
      ..add(GuserFieldsVars.serializer)
      ..add(Guser_bool_exp.serializer)
      ..add(Guser_constraint.serializer)
      ..add(Guser_insert_input.serializer)
      ..add(Guser_obj_rel_insert_input.serializer)
      ..add(Guser_on_conflict.serializer)
      ..add(Guser_order_by.serializer)
      ..add(Guser_pk_columns_input.serializer)
      ..add(Guser_select_column.serializer)
      ..add(Guser_set_input.serializer)
      ..add(Guser_stream_cursor_input.serializer)
      ..add(Guser_stream_cursor_value_input.serializer)
      ..add(Guser_update_column.serializer)
      ..add(Guser_updates.serializer)
      ..add(Gvote_beacon_bool_exp.serializer)
      ..add(Gvote_beacon_constraint.serializer)
      ..add(Gvote_beacon_inc_input.serializer)
      ..add(Gvote_beacon_insert_input.serializer)
      ..add(Gvote_beacon_on_conflict.serializer)
      ..add(Gvote_beacon_order_by.serializer)
      ..add(Gvote_beacon_pk_columns_input.serializer)
      ..add(Gvote_beacon_select_column.serializer)
      ..add(Gvote_beacon_set_input.serializer)
      ..add(Gvote_beacon_stream_cursor_input.serializer)
      ..add(Gvote_beacon_stream_cursor_value_input.serializer)
      ..add(Gvote_beacon_update_column.serializer)
      ..add(Gvote_beacon_updates.serializer)
      ..add(Gvote_comment_bool_exp.serializer)
      ..add(Gvote_comment_constraint.serializer)
      ..add(Gvote_comment_inc_input.serializer)
      ..add(Gvote_comment_insert_input.serializer)
      ..add(Gvote_comment_on_conflict.serializer)
      ..add(Gvote_comment_order_by.serializer)
      ..add(Gvote_comment_pk_columns_input.serializer)
      ..add(Gvote_comment_select_column.serializer)
      ..add(Gvote_comment_set_input.serializer)
      ..add(Gvote_comment_stream_cursor_input.serializer)
      ..add(Gvote_comment_stream_cursor_value_input.serializer)
      ..add(Gvote_comment_update_column.serializer)
      ..add(Gvote_comment_updates.serializer)
      ..add(Gvote_user_bool_exp.serializer)
      ..add(Gvote_user_constraint.serializer)
      ..add(Gvote_user_inc_input.serializer)
      ..add(Gvote_user_insert_input.serializer)
      ..add(Gvote_user_on_conflict.serializer)
      ..add(Gvote_user_order_by.serializer)
      ..add(Gvote_user_pk_columns_input.serializer)
      ..add(Gvote_user_select_column.serializer)
      ..add(Gvote_user_set_input.serializer)
      ..add(Gvote_user_stream_cursor_input.serializer)
      ..add(Gvote_user_stream_cursor_value_input.serializer)
      ..add(Gvote_user_update_column.serializer)
      ..add(Gvote_user_updates.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DateTime)]),
          () => new ListBuilder<DateTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DateTime)]),
          () => new ListBuilder<DateTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DateTimeRange)]),
          () => new ListBuilder<DateTimeRange>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DateTimeRange)]),
          () => new ListBuilder<DateTimeRange>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFetchBeaconsByUserIdData_beacon)]),
          () => new ListBuilder<GFetchBeaconsByUserIdData_beacon>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFetchCommentsByBeaconIdData_comment)]),
          () => new ListBuilder<GFetchCommentsByBeaconIdData_comment>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GSearchBeaconData_beacon)]),
          () => new ListBuilder<GSearchBeaconData_beacon>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Gbeacon_bool_exp)]),
          () => new ListBuilder<Gbeacon_bool_exp>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Gbeacon_bool_exp)]),
          () => new ListBuilder<Gbeacon_bool_exp>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gbeacon_update_column)]),
          () => new ListBuilder<Gbeacon_update_column>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Gcomment_bool_exp)]),
          () => new ListBuilder<Gcomment_bool_exp>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Gcomment_bool_exp)]),
          () => new ListBuilder<Gcomment_bool_exp>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gcomment_insert_input)]),
          () => new ListBuilder<Gcomment_insert_input>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gcomment_select_column)]),
          () => new ListBuilder<Gcomment_select_column>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gcomment_update_column)]),
          () => new ListBuilder<Gcomment_update_column>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Ggeometry)]),
          () => new ListBuilder<Ggeometry>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Ggeometry)]),
          () => new ListBuilder<Ggeometry>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Guser_bool_exp)]),
          () => new ListBuilder<Guser_bool_exp>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Guser_bool_exp)]),
          () => new ListBuilder<Guser_bool_exp>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Guser_update_column)]),
          () => new ListBuilder<Guser_update_column>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gvote_beacon_bool_exp)]),
          () => new ListBuilder<Gvote_beacon_bool_exp>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gvote_beacon_bool_exp)]),
          () => new ListBuilder<Gvote_beacon_bool_exp>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gvote_beacon_update_column)]),
          () => new ListBuilder<Gvote_beacon_update_column>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gvote_comment_bool_exp)]),
          () => new ListBuilder<Gvote_comment_bool_exp>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gvote_comment_bool_exp)]),
          () => new ListBuilder<Gvote_comment_bool_exp>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gvote_comment_update_column)]),
          () => new ListBuilder<Gvote_comment_update_column>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gvote_user_bool_exp)]),
          () => new ListBuilder<Gvote_user_bool_exp>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gvote_user_bool_exp)]),
          () => new ListBuilder<Gvote_user_bool_exp>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(Gvote_user_update_column)]),
          () => new ListBuilder<Gvote_user_update_column>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LatLng)]),
          () => new ListBuilder<LatLng>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LatLng)]),
          () => new ListBuilder<LatLng>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(bool)]),
          () => new ListBuilder<bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(bool)]),
          () => new ListBuilder<bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
