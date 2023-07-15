// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' as _i3;
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i4;
import 'package:gravity/data/gql/_g/serializers.gql.dart' as _i1;
import 'package:latlong2/latlong.dart' as _i2;

part 'schema.schema.gql.g.dart';

abstract class Gbeacon_bool_exp
    implements Built<Gbeacon_bool_exp, Gbeacon_bool_expBuilder> {
  Gbeacon_bool_exp._();

  factory Gbeacon_bool_exp([Function(Gbeacon_bool_expBuilder b) updates]) =
      _$Gbeacon_bool_exp;

  @BuiltValueField(wireName: '_and')
  BuiltList<Gbeacon_bool_exp>? get G_and;
  @BuiltValueField(wireName: '_not')
  Gbeacon_bool_exp? get G_not;
  @BuiltValueField(wireName: '_or')
  BuiltList<Gbeacon_bool_exp>? get G_or;
  Guser_bool_exp? get author;
  Gcomment_bool_exp? get comments;
  Gcomment_aggregate_bool_exp? get comments_aggregate;
  GInt_comparison_exp? get comments_count;
  Gtimestamptz_comparison_exp? get created_at;
  GString_comparison_exp? get description;
  GBoolean_comparison_exp? get enabled;
  GBoolean_comparison_exp? get has_picture;
  GString_comparison_exp? get id;
  Ggeography_comparison_exp? get place;
  Gtstzrange_comparison_exp? get timerange;
  GString_comparison_exp? get title;
  Gtimestamptz_comparison_exp? get updated_at;
  GString_comparison_exp? get user_id;
  static Serializer<Gbeacon_bool_exp> get serializer =>
      _$gbeaconBoolExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_bool_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_bool_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_bool_exp.serializer,
        json,
      );
}

class Gbeacon_constraint extends EnumClass {
  const Gbeacon_constraint._(String name) : super(name);

  static const Gbeacon_constraint beacon_pkey = _$gbeaconConstraintbeacon_pkey;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gbeacon_constraint gUnknownEnumValue =
      _$gbeaconConstraintgUnknownEnumValue;

  static Serializer<Gbeacon_constraint> get serializer =>
      _$gbeaconConstraintSerializer;
  static BuiltSet<Gbeacon_constraint> get values => _$gbeaconConstraintValues;
  static Gbeacon_constraint valueOf(String name) =>
      _$gbeaconConstraintValueOf(name);
}

abstract class Gbeacon_inc_input
    implements Built<Gbeacon_inc_input, Gbeacon_inc_inputBuilder> {
  Gbeacon_inc_input._();

  factory Gbeacon_inc_input([Function(Gbeacon_inc_inputBuilder b) updates]) =
      _$Gbeacon_inc_input;

  int? get comments_count;
  static Serializer<Gbeacon_inc_input> get serializer =>
      _$gbeaconIncInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_inc_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_inc_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_inc_input.serializer,
        json,
      );
}

abstract class Gbeacon_insert_input
    implements Built<Gbeacon_insert_input, Gbeacon_insert_inputBuilder> {
  Gbeacon_insert_input._();

  factory Gbeacon_insert_input(
          [Function(Gbeacon_insert_inputBuilder b) updates]) =
      _$Gbeacon_insert_input;

  Guser_obj_rel_insert_input? get author;
  Gcomment_arr_rel_insert_input? get comments;
  int? get comments_count;
  DateTime? get created_at;
  String? get description;
  bool? get enabled;
  bool? get has_picture;
  String? get id;
  _i2.LatLng? get place;
  _i3.DateTimeRange? get timerange;
  String? get title;
  DateTime? get updated_at;
  String? get user_id;
  static Serializer<Gbeacon_insert_input> get serializer =>
      _$gbeaconInsertInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_insert_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_insert_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_insert_input.serializer,
        json,
      );
}

abstract class Gbeacon_on_conflict
    implements Built<Gbeacon_on_conflict, Gbeacon_on_conflictBuilder> {
  Gbeacon_on_conflict._();

  factory Gbeacon_on_conflict(
      [Function(Gbeacon_on_conflictBuilder b) updates]) = _$Gbeacon_on_conflict;

  Gbeacon_constraint get constraint;
  BuiltList<Gbeacon_update_column> get update_columns;
  Gbeacon_bool_exp? get where;
  static Serializer<Gbeacon_on_conflict> get serializer =>
      _$gbeaconOnConflictSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_on_conflict.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_on_conflict? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_on_conflict.serializer,
        json,
      );
}

abstract class Gbeacon_order_by
    implements Built<Gbeacon_order_by, Gbeacon_order_byBuilder> {
  Gbeacon_order_by._();

  factory Gbeacon_order_by([Function(Gbeacon_order_byBuilder b) updates]) =
      _$Gbeacon_order_by;

  Guser_order_by? get author;
  Gcomment_aggregate_order_by? get comments_aggregate;
  Gorder_by? get comments_count;
  Gorder_by? get created_at;
  Gorder_by? get description;
  Gorder_by? get enabled;
  Gorder_by? get has_picture;
  Gorder_by? get id;
  Gorder_by? get place;
  Gorder_by? get timerange;
  Gorder_by? get title;
  Gorder_by? get updated_at;
  Gorder_by? get user_id;
  static Serializer<Gbeacon_order_by> get serializer =>
      _$gbeaconOrderBySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_order_by.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_order_by? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_order_by.serializer,
        json,
      );
}

abstract class Gbeacon_pk_columns_input
    implements
        Built<Gbeacon_pk_columns_input, Gbeacon_pk_columns_inputBuilder> {
  Gbeacon_pk_columns_input._();

  factory Gbeacon_pk_columns_input(
          [Function(Gbeacon_pk_columns_inputBuilder b) updates]) =
      _$Gbeacon_pk_columns_input;

  String get id;
  static Serializer<Gbeacon_pk_columns_input> get serializer =>
      _$gbeaconPkColumnsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_pk_columns_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_pk_columns_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_pk_columns_input.serializer,
        json,
      );
}

class Gbeacon_select_column extends EnumClass {
  const Gbeacon_select_column._(String name) : super(name);

  static const Gbeacon_select_column comments_count =
      _$gbeaconSelectColumncomments_count;

  static const Gbeacon_select_column created_at =
      _$gbeaconSelectColumncreated_at;

  static const Gbeacon_select_column description =
      _$gbeaconSelectColumndescription;

  static const Gbeacon_select_column enabled = _$gbeaconSelectColumnenabled;

  static const Gbeacon_select_column has_picture =
      _$gbeaconSelectColumnhas_picture;

  static const Gbeacon_select_column id = _$gbeaconSelectColumnid;

  static const Gbeacon_select_column place = _$gbeaconSelectColumnplace;

  static const Gbeacon_select_column timerange = _$gbeaconSelectColumntimerange;

  static const Gbeacon_select_column title = _$gbeaconSelectColumntitle;

  static const Gbeacon_select_column updated_at =
      _$gbeaconSelectColumnupdated_at;

  static const Gbeacon_select_column user_id = _$gbeaconSelectColumnuser_id;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gbeacon_select_column gUnknownEnumValue =
      _$gbeaconSelectColumngUnknownEnumValue;

  static Serializer<Gbeacon_select_column> get serializer =>
      _$gbeaconSelectColumnSerializer;
  static BuiltSet<Gbeacon_select_column> get values =>
      _$gbeaconSelectColumnValues;
  static Gbeacon_select_column valueOf(String name) =>
      _$gbeaconSelectColumnValueOf(name);
}

abstract class Gbeacon_set_input
    implements Built<Gbeacon_set_input, Gbeacon_set_inputBuilder> {
  Gbeacon_set_input._();

  factory Gbeacon_set_input([Function(Gbeacon_set_inputBuilder b) updates]) =
      _$Gbeacon_set_input;

  int? get comments_count;
  DateTime? get created_at;
  String? get description;
  bool? get enabled;
  bool? get has_picture;
  String? get id;
  _i2.LatLng? get place;
  _i3.DateTimeRange? get timerange;
  String? get title;
  DateTime? get updated_at;
  String? get user_id;
  static Serializer<Gbeacon_set_input> get serializer =>
      _$gbeaconSetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_set_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_set_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_set_input.serializer,
        json,
      );
}

abstract class Gbeacon_stream_cursor_input
    implements
        Built<Gbeacon_stream_cursor_input, Gbeacon_stream_cursor_inputBuilder> {
  Gbeacon_stream_cursor_input._();

  factory Gbeacon_stream_cursor_input(
          [Function(Gbeacon_stream_cursor_inputBuilder b) updates]) =
      _$Gbeacon_stream_cursor_input;

  Gbeacon_stream_cursor_value_input get initial_value;
  Gcursor_ordering? get ordering;
  static Serializer<Gbeacon_stream_cursor_input> get serializer =>
      _$gbeaconStreamCursorInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_stream_cursor_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_stream_cursor_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_stream_cursor_input.serializer,
        json,
      );
}

abstract class Gbeacon_stream_cursor_value_input
    implements
        Built<Gbeacon_stream_cursor_value_input,
            Gbeacon_stream_cursor_value_inputBuilder> {
  Gbeacon_stream_cursor_value_input._();

  factory Gbeacon_stream_cursor_value_input(
          [Function(Gbeacon_stream_cursor_value_inputBuilder b) updates]) =
      _$Gbeacon_stream_cursor_value_input;

  int? get comments_count;
  DateTime? get created_at;
  String? get description;
  bool? get enabled;
  bool? get has_picture;
  String? get id;
  _i2.LatLng? get place;
  _i3.DateTimeRange? get timerange;
  String? get title;
  DateTime? get updated_at;
  String? get user_id;
  static Serializer<Gbeacon_stream_cursor_value_input> get serializer =>
      _$gbeaconStreamCursorValueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_stream_cursor_value_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_stream_cursor_value_input? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_stream_cursor_value_input.serializer,
        json,
      );
}

class Gbeacon_update_column extends EnumClass {
  const Gbeacon_update_column._(String name) : super(name);

  static const Gbeacon_update_column comments_count =
      _$gbeaconUpdateColumncomments_count;

  static const Gbeacon_update_column created_at =
      _$gbeaconUpdateColumncreated_at;

  static const Gbeacon_update_column description =
      _$gbeaconUpdateColumndescription;

  static const Gbeacon_update_column enabled = _$gbeaconUpdateColumnenabled;

  static const Gbeacon_update_column has_picture =
      _$gbeaconUpdateColumnhas_picture;

  static const Gbeacon_update_column id = _$gbeaconUpdateColumnid;

  static const Gbeacon_update_column place = _$gbeaconUpdateColumnplace;

  static const Gbeacon_update_column timerange = _$gbeaconUpdateColumntimerange;

  static const Gbeacon_update_column title = _$gbeaconUpdateColumntitle;

  static const Gbeacon_update_column updated_at =
      _$gbeaconUpdateColumnupdated_at;

  static const Gbeacon_update_column user_id = _$gbeaconUpdateColumnuser_id;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gbeacon_update_column gUnknownEnumValue =
      _$gbeaconUpdateColumngUnknownEnumValue;

  static Serializer<Gbeacon_update_column> get serializer =>
      _$gbeaconUpdateColumnSerializer;
  static BuiltSet<Gbeacon_update_column> get values =>
      _$gbeaconUpdateColumnValues;
  static Gbeacon_update_column valueOf(String name) =>
      _$gbeaconUpdateColumnValueOf(name);
}

abstract class Gbeacon_updates
    implements Built<Gbeacon_updates, Gbeacon_updatesBuilder> {
  Gbeacon_updates._();

  factory Gbeacon_updates([Function(Gbeacon_updatesBuilder b) updates]) =
      _$Gbeacon_updates;

  @BuiltValueField(wireName: '_inc')
  Gbeacon_inc_input? get G_inc;
  @BuiltValueField(wireName: '_set')
  Gbeacon_set_input? get G_set;
  Gbeacon_bool_exp get where;
  static Serializer<Gbeacon_updates> get serializer =>
      _$gbeaconUpdatesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gbeacon_updates.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gbeacon_updates? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gbeacon_updates.serializer,
        json,
      );
}

abstract class GBoolean_comparison_exp
    implements Built<GBoolean_comparison_exp, GBoolean_comparison_expBuilder> {
  GBoolean_comparison_exp._();

  factory GBoolean_comparison_exp(
          [Function(GBoolean_comparison_expBuilder b) updates]) =
      _$GBoolean_comparison_exp;

  @BuiltValueField(wireName: '_eq')
  bool? get G_eq;
  @BuiltValueField(wireName: '_gt')
  bool? get G_gt;
  @BuiltValueField(wireName: '_gte')
  bool? get G_gte;
  @BuiltValueField(wireName: '_in')
  BuiltList<bool>? get G_in;
  @BuiltValueField(wireName: '_is_null')
  bool? get G_is_null;
  @BuiltValueField(wireName: '_lt')
  bool? get G_lt;
  @BuiltValueField(wireName: '_lte')
  bool? get G_lte;
  @BuiltValueField(wireName: '_neq')
  bool? get G_neq;
  @BuiltValueField(wireName: '_nin')
  BuiltList<bool>? get G_nin;
  static Serializer<GBoolean_comparison_exp> get serializer =>
      _$gBooleanComparisonExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBoolean_comparison_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBoolean_comparison_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBoolean_comparison_exp.serializer,
        json,
      );
}

abstract class Gcomment_aggregate_bool_exp
    implements
        Built<Gcomment_aggregate_bool_exp, Gcomment_aggregate_bool_expBuilder> {
  Gcomment_aggregate_bool_exp._();

  factory Gcomment_aggregate_bool_exp(
          [Function(Gcomment_aggregate_bool_expBuilder b) updates]) =
      _$Gcomment_aggregate_bool_exp;

  Gcomment_aggregate_bool_exp_count? get count;
  static Serializer<Gcomment_aggregate_bool_exp> get serializer =>
      _$gcommentAggregateBoolExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_aggregate_bool_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_aggregate_bool_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_aggregate_bool_exp.serializer,
        json,
      );
}

abstract class Gcomment_aggregate_bool_exp_count
    implements
        Built<Gcomment_aggregate_bool_exp_count,
            Gcomment_aggregate_bool_exp_countBuilder> {
  Gcomment_aggregate_bool_exp_count._();

  factory Gcomment_aggregate_bool_exp_count(
          [Function(Gcomment_aggregate_bool_exp_countBuilder b) updates]) =
      _$Gcomment_aggregate_bool_exp_count;

  BuiltList<Gcomment_select_column>? get arguments;
  bool? get distinct;
  Gcomment_bool_exp? get filter;
  GInt_comparison_exp get predicate;
  static Serializer<Gcomment_aggregate_bool_exp_count> get serializer =>
      _$gcommentAggregateBoolExpCountSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_aggregate_bool_exp_count.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_aggregate_bool_exp_count? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_aggregate_bool_exp_count.serializer,
        json,
      );
}

abstract class Gcomment_aggregate_order_by
    implements
        Built<Gcomment_aggregate_order_by, Gcomment_aggregate_order_byBuilder> {
  Gcomment_aggregate_order_by._();

  factory Gcomment_aggregate_order_by(
          [Function(Gcomment_aggregate_order_byBuilder b) updates]) =
      _$Gcomment_aggregate_order_by;

  Gorder_by? get count;
  Gcomment_max_order_by? get max;
  Gcomment_min_order_by? get min;
  static Serializer<Gcomment_aggregate_order_by> get serializer =>
      _$gcommentAggregateOrderBySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_aggregate_order_by.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_aggregate_order_by? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_aggregate_order_by.serializer,
        json,
      );
}

abstract class Gcomment_arr_rel_insert_input
    implements
        Built<Gcomment_arr_rel_insert_input,
            Gcomment_arr_rel_insert_inputBuilder> {
  Gcomment_arr_rel_insert_input._();

  factory Gcomment_arr_rel_insert_input(
          [Function(Gcomment_arr_rel_insert_inputBuilder b) updates]) =
      _$Gcomment_arr_rel_insert_input;

  BuiltList<Gcomment_insert_input> get data;
  Gcomment_on_conflict? get on_conflict;
  static Serializer<Gcomment_arr_rel_insert_input> get serializer =>
      _$gcommentArrRelInsertInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_arr_rel_insert_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_arr_rel_insert_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_arr_rel_insert_input.serializer,
        json,
      );
}

abstract class Gcomment_bool_exp
    implements Built<Gcomment_bool_exp, Gcomment_bool_expBuilder> {
  Gcomment_bool_exp._();

  factory Gcomment_bool_exp([Function(Gcomment_bool_expBuilder b) updates]) =
      _$Gcomment_bool_exp;

  @BuiltValueField(wireName: '_and')
  BuiltList<Gcomment_bool_exp>? get G_and;
  @BuiltValueField(wireName: '_not')
  Gcomment_bool_exp? get G_not;
  @BuiltValueField(wireName: '_or')
  BuiltList<Gcomment_bool_exp>? get G_or;
  Guser_bool_exp? get author;
  GString_comparison_exp? get beacon_id;
  GString_comparison_exp? get content;
  Gtimestamptz_comparison_exp? get created_at;
  GString_comparison_exp? get id;
  GString_comparison_exp? get user_id;
  static Serializer<Gcomment_bool_exp> get serializer =>
      _$gcommentBoolExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_bool_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_bool_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_bool_exp.serializer,
        json,
      );
}

class Gcomment_constraint extends EnumClass {
  const Gcomment_constraint._(String name) : super(name);

  static const Gcomment_constraint comment_pkey =
      _$gcommentConstraintcomment_pkey;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gcomment_constraint gUnknownEnumValue =
      _$gcommentConstraintgUnknownEnumValue;

  static Serializer<Gcomment_constraint> get serializer =>
      _$gcommentConstraintSerializer;
  static BuiltSet<Gcomment_constraint> get values => _$gcommentConstraintValues;
  static Gcomment_constraint valueOf(String name) =>
      _$gcommentConstraintValueOf(name);
}

abstract class Gcomment_insert_input
    implements Built<Gcomment_insert_input, Gcomment_insert_inputBuilder> {
  Gcomment_insert_input._();

  factory Gcomment_insert_input(
          [Function(Gcomment_insert_inputBuilder b) updates]) =
      _$Gcomment_insert_input;

  Guser_obj_rel_insert_input? get author;
  String? get beacon_id;
  String? get content;
  DateTime? get created_at;
  String? get id;
  String? get user_id;
  static Serializer<Gcomment_insert_input> get serializer =>
      _$gcommentInsertInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_insert_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_insert_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_insert_input.serializer,
        json,
      );
}

abstract class Gcomment_max_order_by
    implements Built<Gcomment_max_order_by, Gcomment_max_order_byBuilder> {
  Gcomment_max_order_by._();

  factory Gcomment_max_order_by(
          [Function(Gcomment_max_order_byBuilder b) updates]) =
      _$Gcomment_max_order_by;

  Gorder_by? get beacon_id;
  Gorder_by? get content;
  Gorder_by? get created_at;
  Gorder_by? get id;
  Gorder_by? get user_id;
  static Serializer<Gcomment_max_order_by> get serializer =>
      _$gcommentMaxOrderBySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_max_order_by.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_max_order_by? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_max_order_by.serializer,
        json,
      );
}

abstract class Gcomment_min_order_by
    implements Built<Gcomment_min_order_by, Gcomment_min_order_byBuilder> {
  Gcomment_min_order_by._();

  factory Gcomment_min_order_by(
          [Function(Gcomment_min_order_byBuilder b) updates]) =
      _$Gcomment_min_order_by;

  Gorder_by? get beacon_id;
  Gorder_by? get content;
  Gorder_by? get created_at;
  Gorder_by? get id;
  Gorder_by? get user_id;
  static Serializer<Gcomment_min_order_by> get serializer =>
      _$gcommentMinOrderBySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_min_order_by.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_min_order_by? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_min_order_by.serializer,
        json,
      );
}

abstract class Gcomment_on_conflict
    implements Built<Gcomment_on_conflict, Gcomment_on_conflictBuilder> {
  Gcomment_on_conflict._();

  factory Gcomment_on_conflict(
          [Function(Gcomment_on_conflictBuilder b) updates]) =
      _$Gcomment_on_conflict;

  Gcomment_constraint get constraint;
  BuiltList<Gcomment_update_column> get update_columns;
  Gcomment_bool_exp? get where;
  static Serializer<Gcomment_on_conflict> get serializer =>
      _$gcommentOnConflictSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_on_conflict.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_on_conflict? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_on_conflict.serializer,
        json,
      );
}

abstract class Gcomment_order_by
    implements Built<Gcomment_order_by, Gcomment_order_byBuilder> {
  Gcomment_order_by._();

  factory Gcomment_order_by([Function(Gcomment_order_byBuilder b) updates]) =
      _$Gcomment_order_by;

  Guser_order_by? get author;
  Gorder_by? get beacon_id;
  Gorder_by? get content;
  Gorder_by? get created_at;
  Gorder_by? get id;
  Gorder_by? get user_id;
  static Serializer<Gcomment_order_by> get serializer =>
      _$gcommentOrderBySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_order_by.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_order_by? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_order_by.serializer,
        json,
      );
}

abstract class Gcomment_pk_columns_input
    implements
        Built<Gcomment_pk_columns_input, Gcomment_pk_columns_inputBuilder> {
  Gcomment_pk_columns_input._();

  factory Gcomment_pk_columns_input(
          [Function(Gcomment_pk_columns_inputBuilder b) updates]) =
      _$Gcomment_pk_columns_input;

  String get id;
  static Serializer<Gcomment_pk_columns_input> get serializer =>
      _$gcommentPkColumnsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_pk_columns_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_pk_columns_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_pk_columns_input.serializer,
        json,
      );
}

class Gcomment_select_column extends EnumClass {
  const Gcomment_select_column._(String name) : super(name);

  static const Gcomment_select_column beacon_id =
      _$gcommentSelectColumnbeacon_id;

  static const Gcomment_select_column content = _$gcommentSelectColumncontent;

  static const Gcomment_select_column created_at =
      _$gcommentSelectColumncreated_at;

  static const Gcomment_select_column id = _$gcommentSelectColumnid;

  static const Gcomment_select_column user_id = _$gcommentSelectColumnuser_id;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gcomment_select_column gUnknownEnumValue =
      _$gcommentSelectColumngUnknownEnumValue;

  static Serializer<Gcomment_select_column> get serializer =>
      _$gcommentSelectColumnSerializer;
  static BuiltSet<Gcomment_select_column> get values =>
      _$gcommentSelectColumnValues;
  static Gcomment_select_column valueOf(String name) =>
      _$gcommentSelectColumnValueOf(name);
}

abstract class Gcomment_set_input
    implements Built<Gcomment_set_input, Gcomment_set_inputBuilder> {
  Gcomment_set_input._();

  factory Gcomment_set_input([Function(Gcomment_set_inputBuilder b) updates]) =
      _$Gcomment_set_input;

  String? get beacon_id;
  String? get content;
  DateTime? get created_at;
  String? get id;
  String? get user_id;
  static Serializer<Gcomment_set_input> get serializer =>
      _$gcommentSetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_set_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_set_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_set_input.serializer,
        json,
      );
}

abstract class Gcomment_stream_cursor_input
    implements
        Built<Gcomment_stream_cursor_input,
            Gcomment_stream_cursor_inputBuilder> {
  Gcomment_stream_cursor_input._();

  factory Gcomment_stream_cursor_input(
          [Function(Gcomment_stream_cursor_inputBuilder b) updates]) =
      _$Gcomment_stream_cursor_input;

  Gcomment_stream_cursor_value_input get initial_value;
  Gcursor_ordering? get ordering;
  static Serializer<Gcomment_stream_cursor_input> get serializer =>
      _$gcommentStreamCursorInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_stream_cursor_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_stream_cursor_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_stream_cursor_input.serializer,
        json,
      );
}

abstract class Gcomment_stream_cursor_value_input
    implements
        Built<Gcomment_stream_cursor_value_input,
            Gcomment_stream_cursor_value_inputBuilder> {
  Gcomment_stream_cursor_value_input._();

  factory Gcomment_stream_cursor_value_input(
          [Function(Gcomment_stream_cursor_value_inputBuilder b) updates]) =
      _$Gcomment_stream_cursor_value_input;

  String? get beacon_id;
  String? get content;
  DateTime? get created_at;
  String? get id;
  String? get user_id;
  static Serializer<Gcomment_stream_cursor_value_input> get serializer =>
      _$gcommentStreamCursorValueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_stream_cursor_value_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_stream_cursor_value_input? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_stream_cursor_value_input.serializer,
        json,
      );
}

class Gcomment_update_column extends EnumClass {
  const Gcomment_update_column._(String name) : super(name);

  static const Gcomment_update_column beacon_id =
      _$gcommentUpdateColumnbeacon_id;

  static const Gcomment_update_column content = _$gcommentUpdateColumncontent;

  static const Gcomment_update_column created_at =
      _$gcommentUpdateColumncreated_at;

  static const Gcomment_update_column id = _$gcommentUpdateColumnid;

  static const Gcomment_update_column user_id = _$gcommentUpdateColumnuser_id;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gcomment_update_column gUnknownEnumValue =
      _$gcommentUpdateColumngUnknownEnumValue;

  static Serializer<Gcomment_update_column> get serializer =>
      _$gcommentUpdateColumnSerializer;
  static BuiltSet<Gcomment_update_column> get values =>
      _$gcommentUpdateColumnValues;
  static Gcomment_update_column valueOf(String name) =>
      _$gcommentUpdateColumnValueOf(name);
}

abstract class Gcomment_updates
    implements Built<Gcomment_updates, Gcomment_updatesBuilder> {
  Gcomment_updates._();

  factory Gcomment_updates([Function(Gcomment_updatesBuilder b) updates]) =
      _$Gcomment_updates;

  @BuiltValueField(wireName: '_set')
  Gcomment_set_input? get G_set;
  Gcomment_bool_exp get where;
  static Serializer<Gcomment_updates> get serializer =>
      _$gcommentUpdatesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gcomment_updates.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gcomment_updates? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gcomment_updates.serializer,
        json,
      );
}

class Gcursor_ordering extends EnumClass {
  const Gcursor_ordering._(String name) : super(name);

  static const Gcursor_ordering ASC = _$gcursorOrderingASC;

  static const Gcursor_ordering DESC = _$gcursorOrderingDESC;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gcursor_ordering gUnknownEnumValue =
      _$gcursorOrderinggUnknownEnumValue;

  static Serializer<Gcursor_ordering> get serializer =>
      _$gcursorOrderingSerializer;
  static BuiltSet<Gcursor_ordering> get values => _$gcursorOrderingValues;
  static Gcursor_ordering valueOf(String name) =>
      _$gcursorOrderingValueOf(name);
}

abstract class Ggeography_cast_exp
    implements Built<Ggeography_cast_exp, Ggeography_cast_expBuilder> {
  Ggeography_cast_exp._();

  factory Ggeography_cast_exp(
      [Function(Ggeography_cast_expBuilder b) updates]) = _$Ggeography_cast_exp;

  Ggeometry_comparison_exp? get geometry;
  static Serializer<Ggeography_cast_exp> get serializer =>
      _$ggeographyCastExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Ggeography_cast_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Ggeography_cast_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Ggeography_cast_exp.serializer,
        json,
      );
}

abstract class Ggeography_comparison_exp
    implements
        Built<Ggeography_comparison_exp, Ggeography_comparison_expBuilder> {
  Ggeography_comparison_exp._();

  factory Ggeography_comparison_exp(
          [Function(Ggeography_comparison_expBuilder b) updates]) =
      _$Ggeography_comparison_exp;

  @BuiltValueField(wireName: '_cast')
  Ggeography_cast_exp? get G_cast;
  @BuiltValueField(wireName: '_eq')
  _i2.LatLng? get G_eq;
  @BuiltValueField(wireName: '_gt')
  _i2.LatLng? get G_gt;
  @BuiltValueField(wireName: '_gte')
  _i2.LatLng? get G_gte;
  @BuiltValueField(wireName: '_in')
  BuiltList<_i2.LatLng>? get G_in;
  @BuiltValueField(wireName: '_is_null')
  bool? get G_is_null;
  @BuiltValueField(wireName: '_lt')
  _i2.LatLng? get G_lt;
  @BuiltValueField(wireName: '_lte')
  _i2.LatLng? get G_lte;
  @BuiltValueField(wireName: '_neq')
  _i2.LatLng? get G_neq;
  @BuiltValueField(wireName: '_nin')
  BuiltList<_i2.LatLng>? get G_nin;
  @BuiltValueField(wireName: '_st_d_within')
  Gst_d_within_geography_input? get G_st_d_within;
  @BuiltValueField(wireName: '_st_intersects')
  _i2.LatLng? get G_st_intersects;
  static Serializer<Ggeography_comparison_exp> get serializer =>
      _$ggeographyComparisonExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Ggeography_comparison_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Ggeography_comparison_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Ggeography_comparison_exp.serializer,
        json,
      );
}

abstract class Ggeometry implements Built<Ggeometry, GgeometryBuilder> {
  Ggeometry._();

  factory Ggeometry([String? value]) =>
      _$Ggeometry((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<Ggeometry> get serializer =>
      _i4.DefaultScalarSerializer<Ggeometry>(
          (Object serialized) => Ggeometry((serialized as String?)));
}

abstract class Ggeometry_cast_exp
    implements Built<Ggeometry_cast_exp, Ggeometry_cast_expBuilder> {
  Ggeometry_cast_exp._();

  factory Ggeometry_cast_exp([Function(Ggeometry_cast_expBuilder b) updates]) =
      _$Ggeometry_cast_exp;

  Ggeography_comparison_exp? get geography;
  static Serializer<Ggeometry_cast_exp> get serializer =>
      _$ggeometryCastExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Ggeometry_cast_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Ggeometry_cast_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Ggeometry_cast_exp.serializer,
        json,
      );
}

abstract class Ggeometry_comparison_exp
    implements
        Built<Ggeometry_comparison_exp, Ggeometry_comparison_expBuilder> {
  Ggeometry_comparison_exp._();

  factory Ggeometry_comparison_exp(
          [Function(Ggeometry_comparison_expBuilder b) updates]) =
      _$Ggeometry_comparison_exp;

  @BuiltValueField(wireName: '_cast')
  Ggeometry_cast_exp? get G_cast;
  @BuiltValueField(wireName: '_eq')
  Ggeometry? get G_eq;
  @BuiltValueField(wireName: '_gt')
  Ggeometry? get G_gt;
  @BuiltValueField(wireName: '_gte')
  Ggeometry? get G_gte;
  @BuiltValueField(wireName: '_in')
  BuiltList<Ggeometry>? get G_in;
  @BuiltValueField(wireName: '_is_null')
  bool? get G_is_null;
  @BuiltValueField(wireName: '_lt')
  Ggeometry? get G_lt;
  @BuiltValueField(wireName: '_lte')
  Ggeometry? get G_lte;
  @BuiltValueField(wireName: '_neq')
  Ggeometry? get G_neq;
  @BuiltValueField(wireName: '_nin')
  BuiltList<Ggeometry>? get G_nin;
  @BuiltValueField(wireName: '_st_3d_d_within')
  Gst_d_within_input? get G_st_3d_d_within;
  @BuiltValueField(wireName: '_st_3d_intersects')
  Ggeometry? get G_st_3d_intersects;
  @BuiltValueField(wireName: '_st_contains')
  Ggeometry? get G_st_contains;
  @BuiltValueField(wireName: '_st_crosses')
  Ggeometry? get G_st_crosses;
  @BuiltValueField(wireName: '_st_d_within')
  Gst_d_within_input? get G_st_d_within;
  @BuiltValueField(wireName: '_st_equals')
  Ggeometry? get G_st_equals;
  @BuiltValueField(wireName: '_st_intersects')
  Ggeometry? get G_st_intersects;
  @BuiltValueField(wireName: '_st_overlaps')
  Ggeometry? get G_st_overlaps;
  @BuiltValueField(wireName: '_st_touches')
  Ggeometry? get G_st_touches;
  @BuiltValueField(wireName: '_st_within')
  Ggeometry? get G_st_within;
  static Serializer<Ggeometry_comparison_exp> get serializer =>
      _$ggeometryComparisonExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Ggeometry_comparison_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Ggeometry_comparison_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Ggeometry_comparison_exp.serializer,
        json,
      );
}

abstract class GInt_comparison_exp
    implements Built<GInt_comparison_exp, GInt_comparison_expBuilder> {
  GInt_comparison_exp._();

  factory GInt_comparison_exp(
      [Function(GInt_comparison_expBuilder b) updates]) = _$GInt_comparison_exp;

  @BuiltValueField(wireName: '_eq')
  int? get G_eq;
  @BuiltValueField(wireName: '_gt')
  int? get G_gt;
  @BuiltValueField(wireName: '_gte')
  int? get G_gte;
  @BuiltValueField(wireName: '_in')
  BuiltList<int>? get G_in;
  @BuiltValueField(wireName: '_is_null')
  bool? get G_is_null;
  @BuiltValueField(wireName: '_lt')
  int? get G_lt;
  @BuiltValueField(wireName: '_lte')
  int? get G_lte;
  @BuiltValueField(wireName: '_neq')
  int? get G_neq;
  @BuiltValueField(wireName: '_nin')
  BuiltList<int>? get G_nin;
  static Serializer<GInt_comparison_exp> get serializer =>
      _$gIntComparisonExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GInt_comparison_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static GInt_comparison_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GInt_comparison_exp.serializer,
        json,
      );
}

class Gorder_by extends EnumClass {
  const Gorder_by._(String name) : super(name);

  static const Gorder_by asc = _$gorderByasc;

  static const Gorder_by asc_nulls_first = _$gorderByasc_nulls_first;

  static const Gorder_by asc_nulls_last = _$gorderByasc_nulls_last;

  static const Gorder_by desc = _$gorderBydesc;

  static const Gorder_by desc_nulls_first = _$gorderBydesc_nulls_first;

  static const Gorder_by desc_nulls_last = _$gorderBydesc_nulls_last;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gorder_by gUnknownEnumValue = _$gorderBygUnknownEnumValue;

  static Serializer<Gorder_by> get serializer => _$gorderBySerializer;
  static BuiltSet<Gorder_by> get values => _$gorderByValues;
  static Gorder_by valueOf(String name) => _$gorderByValueOf(name);
}

abstract class Gst_d_within_geography_input
    implements
        Built<Gst_d_within_geography_input,
            Gst_d_within_geography_inputBuilder> {
  Gst_d_within_geography_input._();

  factory Gst_d_within_geography_input(
          [Function(Gst_d_within_geography_inputBuilder b) updates]) =
      _$Gst_d_within_geography_input;

  double get distance;
  _i2.LatLng get from;
  bool? get use_spheroid;
  static Serializer<Gst_d_within_geography_input> get serializer =>
      _$gstDWithinGeographyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gst_d_within_geography_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gst_d_within_geography_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gst_d_within_geography_input.serializer,
        json,
      );
}

abstract class Gst_d_within_input
    implements Built<Gst_d_within_input, Gst_d_within_inputBuilder> {
  Gst_d_within_input._();

  factory Gst_d_within_input([Function(Gst_d_within_inputBuilder b) updates]) =
      _$Gst_d_within_input;

  double get distance;
  Ggeometry get from;
  static Serializer<Gst_d_within_input> get serializer =>
      _$gstDWithinInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gst_d_within_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gst_d_within_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gst_d_within_input.serializer,
        json,
      );
}

abstract class GString_comparison_exp
    implements Built<GString_comparison_exp, GString_comparison_expBuilder> {
  GString_comparison_exp._();

  factory GString_comparison_exp(
          [Function(GString_comparison_expBuilder b) updates]) =
      _$GString_comparison_exp;

  @BuiltValueField(wireName: '_eq')
  String? get G_eq;
  @BuiltValueField(wireName: '_gt')
  String? get G_gt;
  @BuiltValueField(wireName: '_gte')
  String? get G_gte;
  @BuiltValueField(wireName: '_ilike')
  String? get G_ilike;
  @BuiltValueField(wireName: '_in')
  BuiltList<String>? get G_in;
  @BuiltValueField(wireName: '_iregex')
  String? get G_iregex;
  @BuiltValueField(wireName: '_is_null')
  bool? get G_is_null;
  @BuiltValueField(wireName: '_like')
  String? get G_like;
  @BuiltValueField(wireName: '_lt')
  String? get G_lt;
  @BuiltValueField(wireName: '_lte')
  String? get G_lte;
  @BuiltValueField(wireName: '_neq')
  String? get G_neq;
  @BuiltValueField(wireName: '_nilike')
  String? get G_nilike;
  @BuiltValueField(wireName: '_nin')
  BuiltList<String>? get G_nin;
  @BuiltValueField(wireName: '_niregex')
  String? get G_niregex;
  @BuiltValueField(wireName: '_nlike')
  String? get G_nlike;
  @BuiltValueField(wireName: '_nregex')
  String? get G_nregex;
  @BuiltValueField(wireName: '_nsimilar')
  String? get G_nsimilar;
  @BuiltValueField(wireName: '_regex')
  String? get G_regex;
  @BuiltValueField(wireName: '_similar')
  String? get G_similar;
  static Serializer<GString_comparison_exp> get serializer =>
      _$gStringComparisonExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GString_comparison_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static GString_comparison_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GString_comparison_exp.serializer,
        json,
      );
}

abstract class Gtimestamptz_comparison_exp
    implements
        Built<Gtimestamptz_comparison_exp, Gtimestamptz_comparison_expBuilder> {
  Gtimestamptz_comparison_exp._();

  factory Gtimestamptz_comparison_exp(
          [Function(Gtimestamptz_comparison_expBuilder b) updates]) =
      _$Gtimestamptz_comparison_exp;

  @BuiltValueField(wireName: '_eq')
  DateTime? get G_eq;
  @BuiltValueField(wireName: '_gt')
  DateTime? get G_gt;
  @BuiltValueField(wireName: '_gte')
  DateTime? get G_gte;
  @BuiltValueField(wireName: '_in')
  BuiltList<DateTime>? get G_in;
  @BuiltValueField(wireName: '_is_null')
  bool? get G_is_null;
  @BuiltValueField(wireName: '_lt')
  DateTime? get G_lt;
  @BuiltValueField(wireName: '_lte')
  DateTime? get G_lte;
  @BuiltValueField(wireName: '_neq')
  DateTime? get G_neq;
  @BuiltValueField(wireName: '_nin')
  BuiltList<DateTime>? get G_nin;
  static Serializer<Gtimestamptz_comparison_exp> get serializer =>
      _$gtimestamptzComparisonExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gtimestamptz_comparison_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gtimestamptz_comparison_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gtimestamptz_comparison_exp.serializer,
        json,
      );
}

abstract class Gtstzrange_comparison_exp
    implements
        Built<Gtstzrange_comparison_exp, Gtstzrange_comparison_expBuilder> {
  Gtstzrange_comparison_exp._();

  factory Gtstzrange_comparison_exp(
          [Function(Gtstzrange_comparison_expBuilder b) updates]) =
      _$Gtstzrange_comparison_exp;

  @BuiltValueField(wireName: '_eq')
  _i3.DateTimeRange? get G_eq;
  @BuiltValueField(wireName: '_gt')
  _i3.DateTimeRange? get G_gt;
  @BuiltValueField(wireName: '_gte')
  _i3.DateTimeRange? get G_gte;
  @BuiltValueField(wireName: '_in')
  BuiltList<_i3.DateTimeRange>? get G_in;
  @BuiltValueField(wireName: '_is_null')
  bool? get G_is_null;
  @BuiltValueField(wireName: '_lt')
  _i3.DateTimeRange? get G_lt;
  @BuiltValueField(wireName: '_lte')
  _i3.DateTimeRange? get G_lte;
  @BuiltValueField(wireName: '_neq')
  _i3.DateTimeRange? get G_neq;
  @BuiltValueField(wireName: '_nin')
  BuiltList<_i3.DateTimeRange>? get G_nin;
  static Serializer<Gtstzrange_comparison_exp> get serializer =>
      _$gtstzrangeComparisonExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gtstzrange_comparison_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gtstzrange_comparison_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gtstzrange_comparison_exp.serializer,
        json,
      );
}

abstract class Guser_bool_exp
    implements Built<Guser_bool_exp, Guser_bool_expBuilder> {
  Guser_bool_exp._();

  factory Guser_bool_exp([Function(Guser_bool_expBuilder b) updates]) =
      _$Guser_bool_exp;

  @BuiltValueField(wireName: '_and')
  BuiltList<Guser_bool_exp>? get G_and;
  @BuiltValueField(wireName: '_not')
  Guser_bool_exp? get G_not;
  @BuiltValueField(wireName: '_or')
  BuiltList<Guser_bool_exp>? get G_or;
  Gtimestamptz_comparison_exp? get created_at;
  GString_comparison_exp? get description;
  GBoolean_comparison_exp? get has_picture;
  GString_comparison_exp? get id;
  GString_comparison_exp? get title;
  Gtimestamptz_comparison_exp? get updated_at;
  static Serializer<Guser_bool_exp> get serializer => _$guserBoolExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_bool_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_bool_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_bool_exp.serializer,
        json,
      );
}

class Guser_constraint extends EnumClass {
  const Guser_constraint._(String name) : super(name);

  static const Guser_constraint user_pkey = _$guserConstraintuser_pkey;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Guser_constraint gUnknownEnumValue =
      _$guserConstraintgUnknownEnumValue;

  static Serializer<Guser_constraint> get serializer =>
      _$guserConstraintSerializer;
  static BuiltSet<Guser_constraint> get values => _$guserConstraintValues;
  static Guser_constraint valueOf(String name) =>
      _$guserConstraintValueOf(name);
}

abstract class Guser_insert_input
    implements Built<Guser_insert_input, Guser_insert_inputBuilder> {
  Guser_insert_input._();

  factory Guser_insert_input([Function(Guser_insert_inputBuilder b) updates]) =
      _$Guser_insert_input;

  DateTime? get created_at;
  String? get description;
  bool? get has_picture;
  String? get id;
  String? get title;
  DateTime? get updated_at;
  static Serializer<Guser_insert_input> get serializer =>
      _$guserInsertInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_insert_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_insert_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_insert_input.serializer,
        json,
      );
}

abstract class Guser_obj_rel_insert_input
    implements
        Built<Guser_obj_rel_insert_input, Guser_obj_rel_insert_inputBuilder> {
  Guser_obj_rel_insert_input._();

  factory Guser_obj_rel_insert_input(
          [Function(Guser_obj_rel_insert_inputBuilder b) updates]) =
      _$Guser_obj_rel_insert_input;

  Guser_insert_input get data;
  Guser_on_conflict? get on_conflict;
  static Serializer<Guser_obj_rel_insert_input> get serializer =>
      _$guserObjRelInsertInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_obj_rel_insert_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_obj_rel_insert_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_obj_rel_insert_input.serializer,
        json,
      );
}

abstract class Guser_on_conflict
    implements Built<Guser_on_conflict, Guser_on_conflictBuilder> {
  Guser_on_conflict._();

  factory Guser_on_conflict([Function(Guser_on_conflictBuilder b) updates]) =
      _$Guser_on_conflict;

  Guser_constraint get constraint;
  BuiltList<Guser_update_column> get update_columns;
  Guser_bool_exp? get where;
  static Serializer<Guser_on_conflict> get serializer =>
      _$guserOnConflictSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_on_conflict.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_on_conflict? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_on_conflict.serializer,
        json,
      );
}

abstract class Guser_order_by
    implements Built<Guser_order_by, Guser_order_byBuilder> {
  Guser_order_by._();

  factory Guser_order_by([Function(Guser_order_byBuilder b) updates]) =
      _$Guser_order_by;

  Gorder_by? get created_at;
  Gorder_by? get description;
  Gorder_by? get has_picture;
  Gorder_by? get id;
  Gorder_by? get title;
  Gorder_by? get updated_at;
  static Serializer<Guser_order_by> get serializer => _$guserOrderBySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_order_by.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_order_by? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_order_by.serializer,
        json,
      );
}

abstract class Guser_pk_columns_input
    implements Built<Guser_pk_columns_input, Guser_pk_columns_inputBuilder> {
  Guser_pk_columns_input._();

  factory Guser_pk_columns_input(
          [Function(Guser_pk_columns_inputBuilder b) updates]) =
      _$Guser_pk_columns_input;

  String get id;
  static Serializer<Guser_pk_columns_input> get serializer =>
      _$guserPkColumnsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_pk_columns_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_pk_columns_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_pk_columns_input.serializer,
        json,
      );
}

class Guser_select_column extends EnumClass {
  const Guser_select_column._(String name) : super(name);

  static const Guser_select_column created_at = _$guserSelectColumncreated_at;

  static const Guser_select_column description = _$guserSelectColumndescription;

  static const Guser_select_column has_picture = _$guserSelectColumnhas_picture;

  static const Guser_select_column id = _$guserSelectColumnid;

  static const Guser_select_column title = _$guserSelectColumntitle;

  static const Guser_select_column updated_at = _$guserSelectColumnupdated_at;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Guser_select_column gUnknownEnumValue =
      _$guserSelectColumngUnknownEnumValue;

  static Serializer<Guser_select_column> get serializer =>
      _$guserSelectColumnSerializer;
  static BuiltSet<Guser_select_column> get values => _$guserSelectColumnValues;
  static Guser_select_column valueOf(String name) =>
      _$guserSelectColumnValueOf(name);
}

abstract class Guser_set_input
    implements Built<Guser_set_input, Guser_set_inputBuilder> {
  Guser_set_input._();

  factory Guser_set_input([Function(Guser_set_inputBuilder b) updates]) =
      _$Guser_set_input;

  DateTime? get created_at;
  String? get description;
  bool? get has_picture;
  String? get id;
  String? get title;
  DateTime? get updated_at;
  static Serializer<Guser_set_input> get serializer =>
      _$guserSetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_set_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_set_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_set_input.serializer,
        json,
      );
}

abstract class Guser_stream_cursor_input
    implements
        Built<Guser_stream_cursor_input, Guser_stream_cursor_inputBuilder> {
  Guser_stream_cursor_input._();

  factory Guser_stream_cursor_input(
          [Function(Guser_stream_cursor_inputBuilder b) updates]) =
      _$Guser_stream_cursor_input;

  Guser_stream_cursor_value_input get initial_value;
  Gcursor_ordering? get ordering;
  static Serializer<Guser_stream_cursor_input> get serializer =>
      _$guserStreamCursorInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_stream_cursor_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_stream_cursor_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_stream_cursor_input.serializer,
        json,
      );
}

abstract class Guser_stream_cursor_value_input
    implements
        Built<Guser_stream_cursor_value_input,
            Guser_stream_cursor_value_inputBuilder> {
  Guser_stream_cursor_value_input._();

  factory Guser_stream_cursor_value_input(
          [Function(Guser_stream_cursor_value_inputBuilder b) updates]) =
      _$Guser_stream_cursor_value_input;

  DateTime? get created_at;
  String? get description;
  bool? get has_picture;
  String? get id;
  String? get title;
  DateTime? get updated_at;
  static Serializer<Guser_stream_cursor_value_input> get serializer =>
      _$guserStreamCursorValueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_stream_cursor_value_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_stream_cursor_value_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_stream_cursor_value_input.serializer,
        json,
      );
}

class Guser_update_column extends EnumClass {
  const Guser_update_column._(String name) : super(name);

  static const Guser_update_column created_at = _$guserUpdateColumncreated_at;

  static const Guser_update_column description = _$guserUpdateColumndescription;

  static const Guser_update_column has_picture = _$guserUpdateColumnhas_picture;

  static const Guser_update_column id = _$guserUpdateColumnid;

  static const Guser_update_column title = _$guserUpdateColumntitle;

  static const Guser_update_column updated_at = _$guserUpdateColumnupdated_at;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Guser_update_column gUnknownEnumValue =
      _$guserUpdateColumngUnknownEnumValue;

  static Serializer<Guser_update_column> get serializer =>
      _$guserUpdateColumnSerializer;
  static BuiltSet<Guser_update_column> get values => _$guserUpdateColumnValues;
  static Guser_update_column valueOf(String name) =>
      _$guserUpdateColumnValueOf(name);
}

abstract class Guser_updates
    implements Built<Guser_updates, Guser_updatesBuilder> {
  Guser_updates._();

  factory Guser_updates([Function(Guser_updatesBuilder b) updates]) =
      _$Guser_updates;

  @BuiltValueField(wireName: '_set')
  Guser_set_input? get G_set;
  Guser_bool_exp get where;
  static Serializer<Guser_updates> get serializer => _$guserUpdatesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Guser_updates.serializer,
        this,
      ) as Map<String, dynamic>);
  static Guser_updates? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Guser_updates.serializer,
        json,
      );
}

abstract class Gvote_beacon_bool_exp
    implements Built<Gvote_beacon_bool_exp, Gvote_beacon_bool_expBuilder> {
  Gvote_beacon_bool_exp._();

  factory Gvote_beacon_bool_exp(
          [Function(Gvote_beacon_bool_expBuilder b) updates]) =
      _$Gvote_beacon_bool_exp;

  @BuiltValueField(wireName: '_and')
  BuiltList<Gvote_beacon_bool_exp>? get G_and;
  @BuiltValueField(wireName: '_not')
  Gvote_beacon_bool_exp? get G_not;
  @BuiltValueField(wireName: '_or')
  BuiltList<Gvote_beacon_bool_exp>? get G_or;
  GInt_comparison_exp? get amount;
  Gtimestamptz_comparison_exp? get created_at;
  GString_comparison_exp? get object;
  GString_comparison_exp? get subject;
  Gtimestamptz_comparison_exp? get updated_at;
  static Serializer<Gvote_beacon_bool_exp> get serializer =>
      _$gvoteBeaconBoolExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_bool_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_bool_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_bool_exp.serializer,
        json,
      );
}

class Gvote_beacon_constraint extends EnumClass {
  const Gvote_beacon_constraint._(String name) : super(name);

  static const Gvote_beacon_constraint vote_beacon_pkey =
      _$gvoteBeaconConstraintvote_beacon_pkey;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gvote_beacon_constraint gUnknownEnumValue =
      _$gvoteBeaconConstraintgUnknownEnumValue;

  static Serializer<Gvote_beacon_constraint> get serializer =>
      _$gvoteBeaconConstraintSerializer;
  static BuiltSet<Gvote_beacon_constraint> get values =>
      _$gvoteBeaconConstraintValues;
  static Gvote_beacon_constraint valueOf(String name) =>
      _$gvoteBeaconConstraintValueOf(name);
}

abstract class Gvote_beacon_inc_input
    implements Built<Gvote_beacon_inc_input, Gvote_beacon_inc_inputBuilder> {
  Gvote_beacon_inc_input._();

  factory Gvote_beacon_inc_input(
          [Function(Gvote_beacon_inc_inputBuilder b) updates]) =
      _$Gvote_beacon_inc_input;

  int? get amount;
  static Serializer<Gvote_beacon_inc_input> get serializer =>
      _$gvoteBeaconIncInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_inc_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_inc_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_inc_input.serializer,
        json,
      );
}

abstract class Gvote_beacon_insert_input
    implements
        Built<Gvote_beacon_insert_input, Gvote_beacon_insert_inputBuilder> {
  Gvote_beacon_insert_input._();

  factory Gvote_beacon_insert_input(
          [Function(Gvote_beacon_insert_inputBuilder b) updates]) =
      _$Gvote_beacon_insert_input;

  int? get amount;
  DateTime? get created_at;
  String? get object;
  String? get subject;
  DateTime? get updated_at;
  static Serializer<Gvote_beacon_insert_input> get serializer =>
      _$gvoteBeaconInsertInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_insert_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_insert_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_insert_input.serializer,
        json,
      );
}

abstract class Gvote_beacon_on_conflict
    implements
        Built<Gvote_beacon_on_conflict, Gvote_beacon_on_conflictBuilder> {
  Gvote_beacon_on_conflict._();

  factory Gvote_beacon_on_conflict(
          [Function(Gvote_beacon_on_conflictBuilder b) updates]) =
      _$Gvote_beacon_on_conflict;

  Gvote_beacon_constraint get constraint;
  BuiltList<Gvote_beacon_update_column> get update_columns;
  Gvote_beacon_bool_exp? get where;
  static Serializer<Gvote_beacon_on_conflict> get serializer =>
      _$gvoteBeaconOnConflictSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_on_conflict.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_on_conflict? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_on_conflict.serializer,
        json,
      );
}

abstract class Gvote_beacon_order_by
    implements Built<Gvote_beacon_order_by, Gvote_beacon_order_byBuilder> {
  Gvote_beacon_order_by._();

  factory Gvote_beacon_order_by(
          [Function(Gvote_beacon_order_byBuilder b) updates]) =
      _$Gvote_beacon_order_by;

  Gorder_by? get amount;
  Gorder_by? get created_at;
  Gorder_by? get object;
  Gorder_by? get subject;
  Gorder_by? get updated_at;
  static Serializer<Gvote_beacon_order_by> get serializer =>
      _$gvoteBeaconOrderBySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_order_by.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_order_by? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_order_by.serializer,
        json,
      );
}

abstract class Gvote_beacon_pk_columns_input
    implements
        Built<Gvote_beacon_pk_columns_input,
            Gvote_beacon_pk_columns_inputBuilder> {
  Gvote_beacon_pk_columns_input._();

  factory Gvote_beacon_pk_columns_input(
          [Function(Gvote_beacon_pk_columns_inputBuilder b) updates]) =
      _$Gvote_beacon_pk_columns_input;

  String get object;
  String get subject;
  static Serializer<Gvote_beacon_pk_columns_input> get serializer =>
      _$gvoteBeaconPkColumnsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_pk_columns_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_pk_columns_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_pk_columns_input.serializer,
        json,
      );
}

class Gvote_beacon_select_column extends EnumClass {
  const Gvote_beacon_select_column._(String name) : super(name);

  static const Gvote_beacon_select_column amount =
      _$gvoteBeaconSelectColumnamount;

  static const Gvote_beacon_select_column created_at =
      _$gvoteBeaconSelectColumncreated_at;

  static const Gvote_beacon_select_column object =
      _$gvoteBeaconSelectColumnobject;

  static const Gvote_beacon_select_column subject =
      _$gvoteBeaconSelectColumnsubject;

  static const Gvote_beacon_select_column updated_at =
      _$gvoteBeaconSelectColumnupdated_at;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gvote_beacon_select_column gUnknownEnumValue =
      _$gvoteBeaconSelectColumngUnknownEnumValue;

  static Serializer<Gvote_beacon_select_column> get serializer =>
      _$gvoteBeaconSelectColumnSerializer;
  static BuiltSet<Gvote_beacon_select_column> get values =>
      _$gvoteBeaconSelectColumnValues;
  static Gvote_beacon_select_column valueOf(String name) =>
      _$gvoteBeaconSelectColumnValueOf(name);
}

abstract class Gvote_beacon_set_input
    implements Built<Gvote_beacon_set_input, Gvote_beacon_set_inputBuilder> {
  Gvote_beacon_set_input._();

  factory Gvote_beacon_set_input(
          [Function(Gvote_beacon_set_inputBuilder b) updates]) =
      _$Gvote_beacon_set_input;

  int? get amount;
  DateTime? get created_at;
  String? get object;
  String? get subject;
  DateTime? get updated_at;
  static Serializer<Gvote_beacon_set_input> get serializer =>
      _$gvoteBeaconSetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_set_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_set_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_set_input.serializer,
        json,
      );
}

abstract class Gvote_beacon_stream_cursor_input
    implements
        Built<Gvote_beacon_stream_cursor_input,
            Gvote_beacon_stream_cursor_inputBuilder> {
  Gvote_beacon_stream_cursor_input._();

  factory Gvote_beacon_stream_cursor_input(
          [Function(Gvote_beacon_stream_cursor_inputBuilder b) updates]) =
      _$Gvote_beacon_stream_cursor_input;

  Gvote_beacon_stream_cursor_value_input get initial_value;
  Gcursor_ordering? get ordering;
  static Serializer<Gvote_beacon_stream_cursor_input> get serializer =>
      _$gvoteBeaconStreamCursorInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_stream_cursor_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_stream_cursor_input? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_stream_cursor_input.serializer,
        json,
      );
}

abstract class Gvote_beacon_stream_cursor_value_input
    implements
        Built<Gvote_beacon_stream_cursor_value_input,
            Gvote_beacon_stream_cursor_value_inputBuilder> {
  Gvote_beacon_stream_cursor_value_input._();

  factory Gvote_beacon_stream_cursor_value_input(
          [Function(Gvote_beacon_stream_cursor_value_inputBuilder b) updates]) =
      _$Gvote_beacon_stream_cursor_value_input;

  int? get amount;
  DateTime? get created_at;
  String? get object;
  String? get subject;
  DateTime? get updated_at;
  static Serializer<Gvote_beacon_stream_cursor_value_input> get serializer =>
      _$gvoteBeaconStreamCursorValueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_stream_cursor_value_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_stream_cursor_value_input? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_stream_cursor_value_input.serializer,
        json,
      );
}

class Gvote_beacon_update_column extends EnumClass {
  const Gvote_beacon_update_column._(String name) : super(name);

  static const Gvote_beacon_update_column amount =
      _$gvoteBeaconUpdateColumnamount;

  static const Gvote_beacon_update_column created_at =
      _$gvoteBeaconUpdateColumncreated_at;

  static const Gvote_beacon_update_column object =
      _$gvoteBeaconUpdateColumnobject;

  static const Gvote_beacon_update_column subject =
      _$gvoteBeaconUpdateColumnsubject;

  static const Gvote_beacon_update_column updated_at =
      _$gvoteBeaconUpdateColumnupdated_at;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gvote_beacon_update_column gUnknownEnumValue =
      _$gvoteBeaconUpdateColumngUnknownEnumValue;

  static Serializer<Gvote_beacon_update_column> get serializer =>
      _$gvoteBeaconUpdateColumnSerializer;
  static BuiltSet<Gvote_beacon_update_column> get values =>
      _$gvoteBeaconUpdateColumnValues;
  static Gvote_beacon_update_column valueOf(String name) =>
      _$gvoteBeaconUpdateColumnValueOf(name);
}

abstract class Gvote_beacon_updates
    implements Built<Gvote_beacon_updates, Gvote_beacon_updatesBuilder> {
  Gvote_beacon_updates._();

  factory Gvote_beacon_updates(
          [Function(Gvote_beacon_updatesBuilder b) updates]) =
      _$Gvote_beacon_updates;

  @BuiltValueField(wireName: '_inc')
  Gvote_beacon_inc_input? get G_inc;
  @BuiltValueField(wireName: '_set')
  Gvote_beacon_set_input? get G_set;
  Gvote_beacon_bool_exp get where;
  static Serializer<Gvote_beacon_updates> get serializer =>
      _$gvoteBeaconUpdatesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_beacon_updates.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_beacon_updates? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_beacon_updates.serializer,
        json,
      );
}

abstract class Gvote_comment_bool_exp
    implements Built<Gvote_comment_bool_exp, Gvote_comment_bool_expBuilder> {
  Gvote_comment_bool_exp._();

  factory Gvote_comment_bool_exp(
          [Function(Gvote_comment_bool_expBuilder b) updates]) =
      _$Gvote_comment_bool_exp;

  @BuiltValueField(wireName: '_and')
  BuiltList<Gvote_comment_bool_exp>? get G_and;
  @BuiltValueField(wireName: '_not')
  Gvote_comment_bool_exp? get G_not;
  @BuiltValueField(wireName: '_or')
  BuiltList<Gvote_comment_bool_exp>? get G_or;
  GInt_comparison_exp? get amount;
  Gtimestamptz_comparison_exp? get created_at;
  GString_comparison_exp? get object;
  GString_comparison_exp? get subject;
  Gtimestamptz_comparison_exp? get updated_at;
  static Serializer<Gvote_comment_bool_exp> get serializer =>
      _$gvoteCommentBoolExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_bool_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_bool_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_bool_exp.serializer,
        json,
      );
}

class Gvote_comment_constraint extends EnumClass {
  const Gvote_comment_constraint._(String name) : super(name);

  static const Gvote_comment_constraint vote_comment_pkey =
      _$gvoteCommentConstraintvote_comment_pkey;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gvote_comment_constraint gUnknownEnumValue =
      _$gvoteCommentConstraintgUnknownEnumValue;

  static Serializer<Gvote_comment_constraint> get serializer =>
      _$gvoteCommentConstraintSerializer;
  static BuiltSet<Gvote_comment_constraint> get values =>
      _$gvoteCommentConstraintValues;
  static Gvote_comment_constraint valueOf(String name) =>
      _$gvoteCommentConstraintValueOf(name);
}

abstract class Gvote_comment_inc_input
    implements Built<Gvote_comment_inc_input, Gvote_comment_inc_inputBuilder> {
  Gvote_comment_inc_input._();

  factory Gvote_comment_inc_input(
          [Function(Gvote_comment_inc_inputBuilder b) updates]) =
      _$Gvote_comment_inc_input;

  int? get amount;
  static Serializer<Gvote_comment_inc_input> get serializer =>
      _$gvoteCommentIncInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_inc_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_inc_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_inc_input.serializer,
        json,
      );
}

abstract class Gvote_comment_insert_input
    implements
        Built<Gvote_comment_insert_input, Gvote_comment_insert_inputBuilder> {
  Gvote_comment_insert_input._();

  factory Gvote_comment_insert_input(
          [Function(Gvote_comment_insert_inputBuilder b) updates]) =
      _$Gvote_comment_insert_input;

  int? get amount;
  DateTime? get created_at;
  String? get object;
  String? get subject;
  DateTime? get updated_at;
  static Serializer<Gvote_comment_insert_input> get serializer =>
      _$gvoteCommentInsertInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_insert_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_insert_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_insert_input.serializer,
        json,
      );
}

abstract class Gvote_comment_on_conflict
    implements
        Built<Gvote_comment_on_conflict, Gvote_comment_on_conflictBuilder> {
  Gvote_comment_on_conflict._();

  factory Gvote_comment_on_conflict(
          [Function(Gvote_comment_on_conflictBuilder b) updates]) =
      _$Gvote_comment_on_conflict;

  Gvote_comment_constraint get constraint;
  BuiltList<Gvote_comment_update_column> get update_columns;
  Gvote_comment_bool_exp? get where;
  static Serializer<Gvote_comment_on_conflict> get serializer =>
      _$gvoteCommentOnConflictSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_on_conflict.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_on_conflict? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_on_conflict.serializer,
        json,
      );
}

abstract class Gvote_comment_order_by
    implements Built<Gvote_comment_order_by, Gvote_comment_order_byBuilder> {
  Gvote_comment_order_by._();

  factory Gvote_comment_order_by(
          [Function(Gvote_comment_order_byBuilder b) updates]) =
      _$Gvote_comment_order_by;

  Gorder_by? get amount;
  Gorder_by? get created_at;
  Gorder_by? get object;
  Gorder_by? get subject;
  Gorder_by? get updated_at;
  static Serializer<Gvote_comment_order_by> get serializer =>
      _$gvoteCommentOrderBySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_order_by.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_order_by? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_order_by.serializer,
        json,
      );
}

abstract class Gvote_comment_pk_columns_input
    implements
        Built<Gvote_comment_pk_columns_input,
            Gvote_comment_pk_columns_inputBuilder> {
  Gvote_comment_pk_columns_input._();

  factory Gvote_comment_pk_columns_input(
          [Function(Gvote_comment_pk_columns_inputBuilder b) updates]) =
      _$Gvote_comment_pk_columns_input;

  String get object;
  String get subject;
  static Serializer<Gvote_comment_pk_columns_input> get serializer =>
      _$gvoteCommentPkColumnsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_pk_columns_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_pk_columns_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_pk_columns_input.serializer,
        json,
      );
}

class Gvote_comment_select_column extends EnumClass {
  const Gvote_comment_select_column._(String name) : super(name);

  static const Gvote_comment_select_column amount =
      _$gvoteCommentSelectColumnamount;

  static const Gvote_comment_select_column created_at =
      _$gvoteCommentSelectColumncreated_at;

  static const Gvote_comment_select_column object =
      _$gvoteCommentSelectColumnobject;

  static const Gvote_comment_select_column subject =
      _$gvoteCommentSelectColumnsubject;

  static const Gvote_comment_select_column updated_at =
      _$gvoteCommentSelectColumnupdated_at;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gvote_comment_select_column gUnknownEnumValue =
      _$gvoteCommentSelectColumngUnknownEnumValue;

  static Serializer<Gvote_comment_select_column> get serializer =>
      _$gvoteCommentSelectColumnSerializer;
  static BuiltSet<Gvote_comment_select_column> get values =>
      _$gvoteCommentSelectColumnValues;
  static Gvote_comment_select_column valueOf(String name) =>
      _$gvoteCommentSelectColumnValueOf(name);
}

abstract class Gvote_comment_set_input
    implements Built<Gvote_comment_set_input, Gvote_comment_set_inputBuilder> {
  Gvote_comment_set_input._();

  factory Gvote_comment_set_input(
          [Function(Gvote_comment_set_inputBuilder b) updates]) =
      _$Gvote_comment_set_input;

  int? get amount;
  DateTime? get created_at;
  String? get object;
  String? get subject;
  DateTime? get updated_at;
  static Serializer<Gvote_comment_set_input> get serializer =>
      _$gvoteCommentSetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_set_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_set_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_set_input.serializer,
        json,
      );
}

abstract class Gvote_comment_stream_cursor_input
    implements
        Built<Gvote_comment_stream_cursor_input,
            Gvote_comment_stream_cursor_inputBuilder> {
  Gvote_comment_stream_cursor_input._();

  factory Gvote_comment_stream_cursor_input(
          [Function(Gvote_comment_stream_cursor_inputBuilder b) updates]) =
      _$Gvote_comment_stream_cursor_input;

  Gvote_comment_stream_cursor_value_input get initial_value;
  Gcursor_ordering? get ordering;
  static Serializer<Gvote_comment_stream_cursor_input> get serializer =>
      _$gvoteCommentStreamCursorInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_stream_cursor_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_stream_cursor_input? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_stream_cursor_input.serializer,
        json,
      );
}

abstract class Gvote_comment_stream_cursor_value_input
    implements
        Built<Gvote_comment_stream_cursor_value_input,
            Gvote_comment_stream_cursor_value_inputBuilder> {
  Gvote_comment_stream_cursor_value_input._();

  factory Gvote_comment_stream_cursor_value_input(
      [Function(Gvote_comment_stream_cursor_value_inputBuilder b)
          updates]) = _$Gvote_comment_stream_cursor_value_input;

  int? get amount;
  DateTime? get created_at;
  String? get object;
  String? get subject;
  DateTime? get updated_at;
  static Serializer<Gvote_comment_stream_cursor_value_input> get serializer =>
      _$gvoteCommentStreamCursorValueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_stream_cursor_value_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_stream_cursor_value_input? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_stream_cursor_value_input.serializer,
        json,
      );
}

class Gvote_comment_update_column extends EnumClass {
  const Gvote_comment_update_column._(String name) : super(name);

  static const Gvote_comment_update_column amount =
      _$gvoteCommentUpdateColumnamount;

  static const Gvote_comment_update_column created_at =
      _$gvoteCommentUpdateColumncreated_at;

  static const Gvote_comment_update_column object =
      _$gvoteCommentUpdateColumnobject;

  static const Gvote_comment_update_column subject =
      _$gvoteCommentUpdateColumnsubject;

  static const Gvote_comment_update_column updated_at =
      _$gvoteCommentUpdateColumnupdated_at;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gvote_comment_update_column gUnknownEnumValue =
      _$gvoteCommentUpdateColumngUnknownEnumValue;

  static Serializer<Gvote_comment_update_column> get serializer =>
      _$gvoteCommentUpdateColumnSerializer;
  static BuiltSet<Gvote_comment_update_column> get values =>
      _$gvoteCommentUpdateColumnValues;
  static Gvote_comment_update_column valueOf(String name) =>
      _$gvoteCommentUpdateColumnValueOf(name);
}

abstract class Gvote_comment_updates
    implements Built<Gvote_comment_updates, Gvote_comment_updatesBuilder> {
  Gvote_comment_updates._();

  factory Gvote_comment_updates(
          [Function(Gvote_comment_updatesBuilder b) updates]) =
      _$Gvote_comment_updates;

  @BuiltValueField(wireName: '_inc')
  Gvote_comment_inc_input? get G_inc;
  @BuiltValueField(wireName: '_set')
  Gvote_comment_set_input? get G_set;
  Gvote_comment_bool_exp get where;
  static Serializer<Gvote_comment_updates> get serializer =>
      _$gvoteCommentUpdatesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_comment_updates.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_comment_updates? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_comment_updates.serializer,
        json,
      );
}

abstract class Gvote_user_bool_exp
    implements Built<Gvote_user_bool_exp, Gvote_user_bool_expBuilder> {
  Gvote_user_bool_exp._();

  factory Gvote_user_bool_exp(
      [Function(Gvote_user_bool_expBuilder b) updates]) = _$Gvote_user_bool_exp;

  @BuiltValueField(wireName: '_and')
  BuiltList<Gvote_user_bool_exp>? get G_and;
  @BuiltValueField(wireName: '_not')
  Gvote_user_bool_exp? get G_not;
  @BuiltValueField(wireName: '_or')
  BuiltList<Gvote_user_bool_exp>? get G_or;
  GInt_comparison_exp? get amount;
  Gtimestamptz_comparison_exp? get created_at;
  GString_comparison_exp? get object;
  GString_comparison_exp? get subject;
  Gtimestamptz_comparison_exp? get updated_at;
  static Serializer<Gvote_user_bool_exp> get serializer =>
      _$gvoteUserBoolExpSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_bool_exp.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_bool_exp? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_bool_exp.serializer,
        json,
      );
}

class Gvote_user_constraint extends EnumClass {
  const Gvote_user_constraint._(String name) : super(name);

  static const Gvote_user_constraint vote_user_pkey =
      _$gvoteUserConstraintvote_user_pkey;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gvote_user_constraint gUnknownEnumValue =
      _$gvoteUserConstraintgUnknownEnumValue;

  static Serializer<Gvote_user_constraint> get serializer =>
      _$gvoteUserConstraintSerializer;
  static BuiltSet<Gvote_user_constraint> get values =>
      _$gvoteUserConstraintValues;
  static Gvote_user_constraint valueOf(String name) =>
      _$gvoteUserConstraintValueOf(name);
}

abstract class Gvote_user_inc_input
    implements Built<Gvote_user_inc_input, Gvote_user_inc_inputBuilder> {
  Gvote_user_inc_input._();

  factory Gvote_user_inc_input(
          [Function(Gvote_user_inc_inputBuilder b) updates]) =
      _$Gvote_user_inc_input;

  int? get amount;
  static Serializer<Gvote_user_inc_input> get serializer =>
      _$gvoteUserIncInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_inc_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_inc_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_inc_input.serializer,
        json,
      );
}

abstract class Gvote_user_insert_input
    implements Built<Gvote_user_insert_input, Gvote_user_insert_inputBuilder> {
  Gvote_user_insert_input._();

  factory Gvote_user_insert_input(
          [Function(Gvote_user_insert_inputBuilder b) updates]) =
      _$Gvote_user_insert_input;

  int? get amount;
  DateTime? get created_at;
  String? get object;
  String? get subject;
  DateTime? get updated_at;
  static Serializer<Gvote_user_insert_input> get serializer =>
      _$gvoteUserInsertInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_insert_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_insert_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_insert_input.serializer,
        json,
      );
}

abstract class Gvote_user_on_conflict
    implements Built<Gvote_user_on_conflict, Gvote_user_on_conflictBuilder> {
  Gvote_user_on_conflict._();

  factory Gvote_user_on_conflict(
          [Function(Gvote_user_on_conflictBuilder b) updates]) =
      _$Gvote_user_on_conflict;

  Gvote_user_constraint get constraint;
  BuiltList<Gvote_user_update_column> get update_columns;
  Gvote_user_bool_exp? get where;
  static Serializer<Gvote_user_on_conflict> get serializer =>
      _$gvoteUserOnConflictSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_on_conflict.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_on_conflict? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_on_conflict.serializer,
        json,
      );
}

abstract class Gvote_user_order_by
    implements Built<Gvote_user_order_by, Gvote_user_order_byBuilder> {
  Gvote_user_order_by._();

  factory Gvote_user_order_by(
      [Function(Gvote_user_order_byBuilder b) updates]) = _$Gvote_user_order_by;

  Gorder_by? get amount;
  Gorder_by? get created_at;
  Gorder_by? get object;
  Gorder_by? get subject;
  Gorder_by? get updated_at;
  static Serializer<Gvote_user_order_by> get serializer =>
      _$gvoteUserOrderBySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_order_by.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_order_by? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_order_by.serializer,
        json,
      );
}

abstract class Gvote_user_pk_columns_input
    implements
        Built<Gvote_user_pk_columns_input, Gvote_user_pk_columns_inputBuilder> {
  Gvote_user_pk_columns_input._();

  factory Gvote_user_pk_columns_input(
          [Function(Gvote_user_pk_columns_inputBuilder b) updates]) =
      _$Gvote_user_pk_columns_input;

  String get object;
  String get subject;
  static Serializer<Gvote_user_pk_columns_input> get serializer =>
      _$gvoteUserPkColumnsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_pk_columns_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_pk_columns_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_pk_columns_input.serializer,
        json,
      );
}

class Gvote_user_select_column extends EnumClass {
  const Gvote_user_select_column._(String name) : super(name);

  static const Gvote_user_select_column amount = _$gvoteUserSelectColumnamount;

  static const Gvote_user_select_column created_at =
      _$gvoteUserSelectColumncreated_at;

  static const Gvote_user_select_column object = _$gvoteUserSelectColumnobject;

  static const Gvote_user_select_column subject =
      _$gvoteUserSelectColumnsubject;

  static const Gvote_user_select_column updated_at =
      _$gvoteUserSelectColumnupdated_at;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gvote_user_select_column gUnknownEnumValue =
      _$gvoteUserSelectColumngUnknownEnumValue;

  static Serializer<Gvote_user_select_column> get serializer =>
      _$gvoteUserSelectColumnSerializer;
  static BuiltSet<Gvote_user_select_column> get values =>
      _$gvoteUserSelectColumnValues;
  static Gvote_user_select_column valueOf(String name) =>
      _$gvoteUserSelectColumnValueOf(name);
}

abstract class Gvote_user_set_input
    implements Built<Gvote_user_set_input, Gvote_user_set_inputBuilder> {
  Gvote_user_set_input._();

  factory Gvote_user_set_input(
          [Function(Gvote_user_set_inputBuilder b) updates]) =
      _$Gvote_user_set_input;

  int? get amount;
  DateTime? get created_at;
  String? get object;
  String? get subject;
  DateTime? get updated_at;
  static Serializer<Gvote_user_set_input> get serializer =>
      _$gvoteUserSetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_set_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_set_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_set_input.serializer,
        json,
      );
}

abstract class Gvote_user_stream_cursor_input
    implements
        Built<Gvote_user_stream_cursor_input,
            Gvote_user_stream_cursor_inputBuilder> {
  Gvote_user_stream_cursor_input._();

  factory Gvote_user_stream_cursor_input(
          [Function(Gvote_user_stream_cursor_inputBuilder b) updates]) =
      _$Gvote_user_stream_cursor_input;

  Gvote_user_stream_cursor_value_input get initial_value;
  Gcursor_ordering? get ordering;
  static Serializer<Gvote_user_stream_cursor_input> get serializer =>
      _$gvoteUserStreamCursorInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_stream_cursor_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_stream_cursor_input? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_stream_cursor_input.serializer,
        json,
      );
}

abstract class Gvote_user_stream_cursor_value_input
    implements
        Built<Gvote_user_stream_cursor_value_input,
            Gvote_user_stream_cursor_value_inputBuilder> {
  Gvote_user_stream_cursor_value_input._();

  factory Gvote_user_stream_cursor_value_input(
          [Function(Gvote_user_stream_cursor_value_inputBuilder b) updates]) =
      _$Gvote_user_stream_cursor_value_input;

  int? get amount;
  DateTime? get created_at;
  String? get object;
  String? get subject;
  DateTime? get updated_at;
  static Serializer<Gvote_user_stream_cursor_value_input> get serializer =>
      _$gvoteUserStreamCursorValueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_stream_cursor_value_input.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_stream_cursor_value_input? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_stream_cursor_value_input.serializer,
        json,
      );
}

class Gvote_user_update_column extends EnumClass {
  const Gvote_user_update_column._(String name) : super(name);

  static const Gvote_user_update_column amount = _$gvoteUserUpdateColumnamount;

  static const Gvote_user_update_column created_at =
      _$gvoteUserUpdateColumncreated_at;

  static const Gvote_user_update_column object = _$gvoteUserUpdateColumnobject;

  static const Gvote_user_update_column subject =
      _$gvoteUserUpdateColumnsubject;

  static const Gvote_user_update_column updated_at =
      _$gvoteUserUpdateColumnupdated_at;

  @BuiltValueEnumConst(
    wireName: 'gUnknownEnumValue',
    fallback: true,
  )
  static const Gvote_user_update_column gUnknownEnumValue =
      _$gvoteUserUpdateColumngUnknownEnumValue;

  static Serializer<Gvote_user_update_column> get serializer =>
      _$gvoteUserUpdateColumnSerializer;
  static BuiltSet<Gvote_user_update_column> get values =>
      _$gvoteUserUpdateColumnValues;
  static Gvote_user_update_column valueOf(String name) =>
      _$gvoteUserUpdateColumnValueOf(name);
}

abstract class Gvote_user_updates
    implements Built<Gvote_user_updates, Gvote_user_updatesBuilder> {
  Gvote_user_updates._();

  factory Gvote_user_updates([Function(Gvote_user_updatesBuilder b) updates]) =
      _$Gvote_user_updates;

  @BuiltValueField(wireName: '_inc')
  Gvote_user_inc_input? get G_inc;
  @BuiltValueField(wireName: '_set')
  Gvote_user_set_input? get G_set;
  Gvote_user_bool_exp get where;
  static Serializer<Gvote_user_updates> get serializer =>
      _$gvoteUserUpdatesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        Gvote_user_updates.serializer,
        this,
      ) as Map<String, dynamic>);
  static Gvote_user_updates? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        Gvote_user_updates.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {};
