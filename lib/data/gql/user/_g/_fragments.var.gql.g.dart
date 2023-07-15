// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GuserFieldsVars> _$guserFieldsVarsSerializer =
    new _$GuserFieldsVarsSerializer();

class _$GuserFieldsVarsSerializer
    implements StructuredSerializer<GuserFieldsVars> {
  @override
  final Iterable<Type> types = const [GuserFieldsVars, _$GuserFieldsVars];
  @override
  final String wireName = 'GuserFieldsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GuserFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GuserFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GuserFieldsVarsBuilder().build();
  }
}

class _$GuserFieldsVars extends GuserFieldsVars {
  factory _$GuserFieldsVars([void Function(GuserFieldsVarsBuilder)? updates]) =>
      (new GuserFieldsVarsBuilder()..update(updates))._build();

  _$GuserFieldsVars._() : super._();

  @override
  GuserFieldsVars rebuild(void Function(GuserFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GuserFieldsVarsBuilder toBuilder() =>
      new GuserFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GuserFieldsVars;
  }

  @override
  int get hashCode {
    return 980436665;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GuserFieldsVars').toString();
  }
}

class GuserFieldsVarsBuilder
    implements Builder<GuserFieldsVars, GuserFieldsVarsBuilder> {
  _$GuserFieldsVars? _$v;

  GuserFieldsVarsBuilder();

  @override
  void replace(GuserFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GuserFieldsVars;
  }

  @override
  void update(void Function(GuserFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GuserFieldsVars build() => _build();

  _$GuserFieldsVars _build() {
    final _$result = _$v ?? new _$GuserFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
