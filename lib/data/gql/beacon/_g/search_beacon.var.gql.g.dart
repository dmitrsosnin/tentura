// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_beacon.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSearchBeaconVars> _$gSearchBeaconVarsSerializer =
    new _$GSearchBeaconVarsSerializer();

class _$GSearchBeaconVarsSerializer
    implements StructuredSerializer<GSearchBeaconVars> {
  @override
  final Iterable<Type> types = const [GSearchBeaconVars, _$GSearchBeaconVars];
  @override
  final String wireName = 'GSearchBeaconVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSearchBeaconVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'startsWith',
      serializers.serialize(object.startsWith,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.limit;
    if (value != null) {
      result
        ..add('limit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GSearchBeaconVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSearchBeaconVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'startsWith':
          result.startsWith = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchBeaconVars extends GSearchBeaconVars {
  @override
  final String startsWith;
  @override
  final int? limit;

  factory _$GSearchBeaconVars(
          [void Function(GSearchBeaconVarsBuilder)? updates]) =>
      (new GSearchBeaconVarsBuilder()..update(updates))._build();

  _$GSearchBeaconVars._({required this.startsWith, this.limit}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        startsWith, r'GSearchBeaconVars', 'startsWith');
  }

  @override
  GSearchBeaconVars rebuild(void Function(GSearchBeaconVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchBeaconVarsBuilder toBuilder() =>
      new GSearchBeaconVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchBeaconVars &&
        startsWith == other.startsWith &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startsWith.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSearchBeaconVars')
          ..add('startsWith', startsWith)
          ..add('limit', limit))
        .toString();
  }
}

class GSearchBeaconVarsBuilder
    implements Builder<GSearchBeaconVars, GSearchBeaconVarsBuilder> {
  _$GSearchBeaconVars? _$v;

  String? _startsWith;
  String? get startsWith => _$this._startsWith;
  set startsWith(String? startsWith) => _$this._startsWith = startsWith;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GSearchBeaconVarsBuilder();

  GSearchBeaconVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startsWith = $v.startsWith;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchBeaconVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSearchBeaconVars;
  }

  @override
  void update(void Function(GSearchBeaconVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchBeaconVars build() => _build();

  _$GSearchBeaconVars _build() {
    final _$result = _$v ??
        new _$GSearchBeaconVars._(
            startsWith: BuiltValueNullFieldError.checkNotNull(
                startsWith, r'GSearchBeaconVars', 'startsWith'),
            limit: limit);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
