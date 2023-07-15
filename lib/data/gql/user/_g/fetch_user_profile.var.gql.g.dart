// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_user_profile.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFetchUserProfileVars> _$gFetchUserProfileVarsSerializer =
    new _$GFetchUserProfileVarsSerializer();

class _$GFetchUserProfileVarsSerializer
    implements StructuredSerializer<GFetchUserProfileVars> {
  @override
  final Iterable<Type> types = const [
    GFetchUserProfileVars,
    _$GFetchUserProfileVars
  ];
  @override
  final String wireName = 'GFetchUserProfileVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchUserProfileVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFetchUserProfileVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchUserProfileVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchUserProfileVars extends GFetchUserProfileVars {
  @override
  final String id;

  factory _$GFetchUserProfileVars(
          [void Function(GFetchUserProfileVarsBuilder)? updates]) =>
      (new GFetchUserProfileVarsBuilder()..update(updates))._build();

  _$GFetchUserProfileVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GFetchUserProfileVars', 'id');
  }

  @override
  GFetchUserProfileVars rebuild(
          void Function(GFetchUserProfileVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchUserProfileVarsBuilder toBuilder() =>
      new GFetchUserProfileVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchUserProfileVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFetchUserProfileVars')
          ..add('id', id))
        .toString();
  }
}

class GFetchUserProfileVarsBuilder
    implements Builder<GFetchUserProfileVars, GFetchUserProfileVarsBuilder> {
  _$GFetchUserProfileVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GFetchUserProfileVarsBuilder();

  GFetchUserProfileVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchUserProfileVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchUserProfileVars;
  }

  @override
  void update(void Function(GFetchUserProfileVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchUserProfileVars build() => _build();

  _$GFetchUserProfileVars _build() {
    final _$result = _$v ??
        new _$GFetchUserProfileVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFetchUserProfileVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
