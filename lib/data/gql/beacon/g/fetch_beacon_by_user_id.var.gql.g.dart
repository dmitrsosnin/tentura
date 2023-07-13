// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_beacon_by_user_id.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFetchBeaconsByUserIdVars> _$gFetchBeaconsByUserIdVarsSerializer =
    new _$GFetchBeaconsByUserIdVarsSerializer();

class _$GFetchBeaconsByUserIdVarsSerializer
    implements StructuredSerializer<GFetchBeaconsByUserIdVars> {
  @override
  final Iterable<Type> types = const [
    GFetchBeaconsByUserIdVars,
    _$GFetchBeaconsByUserIdVars
  ];
  @override
  final String wireName = 'GFetchBeaconsByUserIdVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchBeaconsByUserIdVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFetchBeaconsByUserIdVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchBeaconsByUserIdVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchBeaconsByUserIdVars extends GFetchBeaconsByUserIdVars {
  @override
  final String user_id;

  factory _$GFetchBeaconsByUserIdVars(
          [void Function(GFetchBeaconsByUserIdVarsBuilder)? updates]) =>
      (new GFetchBeaconsByUserIdVarsBuilder()..update(updates))._build();

  _$GFetchBeaconsByUserIdVars._({required this.user_id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'GFetchBeaconsByUserIdVars', 'user_id');
  }

  @override
  GFetchBeaconsByUserIdVars rebuild(
          void Function(GFetchBeaconsByUserIdVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchBeaconsByUserIdVarsBuilder toBuilder() =>
      new GFetchBeaconsByUserIdVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchBeaconsByUserIdVars && user_id == other.user_id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFetchBeaconsByUserIdVars')
          ..add('user_id', user_id))
        .toString();
  }
}

class GFetchBeaconsByUserIdVarsBuilder
    implements
        Builder<GFetchBeaconsByUserIdVars, GFetchBeaconsByUserIdVarsBuilder> {
  _$GFetchBeaconsByUserIdVars? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  GFetchBeaconsByUserIdVarsBuilder();

  GFetchBeaconsByUserIdVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchBeaconsByUserIdVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchBeaconsByUserIdVars;
  }

  @override
  void update(void Function(GFetchBeaconsByUserIdVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchBeaconsByUserIdVars build() => _build();

  _$GFetchBeaconsByUserIdVars _build() {
    final _$result = _$v ??
        new _$GFetchBeaconsByUserIdVars._(
            user_id: BuiltValueNullFieldError.checkNotNull(
                user_id, r'GFetchBeaconsByUserIdVars', 'user_id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
