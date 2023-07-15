// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GcommentFieldsVars> _$gcommentFieldsVarsSerializer =
    new _$GcommentFieldsVarsSerializer();

class _$GcommentFieldsVarsSerializer
    implements StructuredSerializer<GcommentFieldsVars> {
  @override
  final Iterable<Type> types = const [GcommentFieldsVars, _$GcommentFieldsVars];
  @override
  final String wireName = 'GcommentFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcommentFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GcommentFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GcommentFieldsVarsBuilder().build();
  }
}

class _$GcommentFieldsVars extends GcommentFieldsVars {
  factory _$GcommentFieldsVars(
          [void Function(GcommentFieldsVarsBuilder)? updates]) =>
      (new GcommentFieldsVarsBuilder()..update(updates))._build();

  _$GcommentFieldsVars._() : super._();

  @override
  GcommentFieldsVars rebuild(
          void Function(GcommentFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcommentFieldsVarsBuilder toBuilder() =>
      new GcommentFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcommentFieldsVars;
  }

  @override
  int get hashCode {
    return 876075237;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GcommentFieldsVars').toString();
  }
}

class GcommentFieldsVarsBuilder
    implements Builder<GcommentFieldsVars, GcommentFieldsVarsBuilder> {
  _$GcommentFieldsVars? _$v;

  GcommentFieldsVarsBuilder();

  @override
  void replace(GcommentFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcommentFieldsVars;
  }

  @override
  void update(void Function(GcommentFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GcommentFieldsVars build() => _build();

  _$GcommentFieldsVars _build() {
    final _$result = _$v ?? new _$GcommentFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
