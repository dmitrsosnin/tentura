// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GbeaconFieldsVars> _$gbeaconFieldsVarsSerializer =
    new _$GbeaconFieldsVarsSerializer();

class _$GbeaconFieldsVarsSerializer
    implements StructuredSerializer<GbeaconFieldsVars> {
  @override
  final Iterable<Type> types = const [GbeaconFieldsVars, _$GbeaconFieldsVars];
  @override
  final String wireName = 'GbeaconFieldsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GbeaconFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GbeaconFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GbeaconFieldsVarsBuilder().build();
  }
}

class _$GbeaconFieldsVars extends GbeaconFieldsVars {
  factory _$GbeaconFieldsVars(
          [void Function(GbeaconFieldsVarsBuilder)? updates]) =>
      (new GbeaconFieldsVarsBuilder()..update(updates))._build();

  _$GbeaconFieldsVars._() : super._();

  @override
  GbeaconFieldsVars rebuild(void Function(GbeaconFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GbeaconFieldsVarsBuilder toBuilder() =>
      new GbeaconFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GbeaconFieldsVars;
  }

  @override
  int get hashCode {
    return 191043786;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GbeaconFieldsVars').toString();
  }
}

class GbeaconFieldsVarsBuilder
    implements Builder<GbeaconFieldsVars, GbeaconFieldsVarsBuilder> {
  _$GbeaconFieldsVars? _$v;

  GbeaconFieldsVarsBuilder();

  @override
  void replace(GbeaconFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GbeaconFieldsVars;
  }

  @override
  void update(void Function(GbeaconFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GbeaconFieldsVars build() => _build();

  _$GbeaconFieldsVars _build() {
    final _$result = _$v ?? new _$GbeaconFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
