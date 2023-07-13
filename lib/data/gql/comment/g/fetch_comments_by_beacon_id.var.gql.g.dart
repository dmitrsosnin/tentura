// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_comments_by_beacon_id.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFetchCommentsByBeaconIdVars>
    _$gFetchCommentsByBeaconIdVarsSerializer =
    new _$GFetchCommentsByBeaconIdVarsSerializer();

class _$GFetchCommentsByBeaconIdVarsSerializer
    implements StructuredSerializer<GFetchCommentsByBeaconIdVars> {
  @override
  final Iterable<Type> types = const [
    GFetchCommentsByBeaconIdVars,
    _$GFetchCommentsByBeaconIdVars
  ];
  @override
  final String wireName = 'GFetchCommentsByBeaconIdVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchCommentsByBeaconIdVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'beacon_id',
      serializers.serialize(object.beacon_id,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFetchCommentsByBeaconIdVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchCommentsByBeaconIdVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'beacon_id':
          result.beacon_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchCommentsByBeaconIdVars extends GFetchCommentsByBeaconIdVars {
  @override
  final String beacon_id;

  factory _$GFetchCommentsByBeaconIdVars(
          [void Function(GFetchCommentsByBeaconIdVarsBuilder)? updates]) =>
      (new GFetchCommentsByBeaconIdVarsBuilder()..update(updates))._build();

  _$GFetchCommentsByBeaconIdVars._({required this.beacon_id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        beacon_id, r'GFetchCommentsByBeaconIdVars', 'beacon_id');
  }

  @override
  GFetchCommentsByBeaconIdVars rebuild(
          void Function(GFetchCommentsByBeaconIdVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchCommentsByBeaconIdVarsBuilder toBuilder() =>
      new GFetchCommentsByBeaconIdVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchCommentsByBeaconIdVars &&
        beacon_id == other.beacon_id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, beacon_id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFetchCommentsByBeaconIdVars')
          ..add('beacon_id', beacon_id))
        .toString();
  }
}

class GFetchCommentsByBeaconIdVarsBuilder
    implements
        Builder<GFetchCommentsByBeaconIdVars,
            GFetchCommentsByBeaconIdVarsBuilder> {
  _$GFetchCommentsByBeaconIdVars? _$v;

  String? _beacon_id;
  String? get beacon_id => _$this._beacon_id;
  set beacon_id(String? beacon_id) => _$this._beacon_id = beacon_id;

  GFetchCommentsByBeaconIdVarsBuilder();

  GFetchCommentsByBeaconIdVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _beacon_id = $v.beacon_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchCommentsByBeaconIdVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchCommentsByBeaconIdVars;
  }

  @override
  void update(void Function(GFetchCommentsByBeaconIdVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchCommentsByBeaconIdVars build() => _build();

  _$GFetchCommentsByBeaconIdVars _build() {
    final _$result = _$v ??
        new _$GFetchCommentsByBeaconIdVars._(
            beacon_id: BuiltValueNullFieldError.checkNotNull(
                beacon_id, r'GFetchCommentsByBeaconIdVars', 'beacon_id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
