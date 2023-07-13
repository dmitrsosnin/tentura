// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateUserData> _$gUpdateUserDataSerializer =
    new _$GUpdateUserDataSerializer();
Serializer<GUpdateUserData_update_user_by_pk>
    _$gUpdateUserDataUpdateUserByPkSerializer =
    new _$GUpdateUserData_update_user_by_pkSerializer();

class _$GUpdateUserDataSerializer
    implements StructuredSerializer<GUpdateUserData> {
  @override
  final Iterable<Type> types = const [GUpdateUserData, _$GUpdateUserData];
  @override
  final String wireName = 'GUpdateUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUpdateUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.update_user_by_pk;
    if (value != null) {
      result
        ..add('update_user_by_pk')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUpdateUserData_update_user_by_pk)));
    }
    return result;
  }

  @override
  GUpdateUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'update_user_by_pk':
          result.update_user_by_pk.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GUpdateUserData_update_user_by_pk))!
              as GUpdateUserData_update_user_by_pk);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserData_update_user_by_pkSerializer
    implements StructuredSerializer<GUpdateUserData_update_user_by_pk> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserData_update_user_by_pk,
    _$GUpdateUserData_update_user_by_pk
  ];
  @override
  final String wireName = 'GUpdateUserData_update_user_by_pk';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserData_update_user_by_pk object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'has_picture',
      serializers.serialize(object.has_picture,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GUpdateUserData_update_user_by_pk deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserData_update_user_by_pkBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'has_picture':
          result.has_picture = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserData extends GUpdateUserData {
  @override
  final String G__typename;
  @override
  final GUpdateUserData_update_user_by_pk? update_user_by_pk;

  factory _$GUpdateUserData([void Function(GUpdateUserDataBuilder)? updates]) =>
      (new GUpdateUserDataBuilder()..update(updates))._build();

  _$GUpdateUserData._({required this.G__typename, this.update_user_by_pk})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateUserData', 'G__typename');
  }

  @override
  GUpdateUserData rebuild(void Function(GUpdateUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserDataBuilder toBuilder() =>
      new GUpdateUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserData &&
        G__typename == other.G__typename &&
        update_user_by_pk == other.update_user_by_pk;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, update_user_by_pk.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateUserData')
          ..add('G__typename', G__typename)
          ..add('update_user_by_pk', update_user_by_pk))
        .toString();
  }
}

class GUpdateUserDataBuilder
    implements Builder<GUpdateUserData, GUpdateUserDataBuilder> {
  _$GUpdateUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateUserData_update_user_by_pkBuilder? _update_user_by_pk;
  GUpdateUserData_update_user_by_pkBuilder get update_user_by_pk =>
      _$this._update_user_by_pk ??=
          new GUpdateUserData_update_user_by_pkBuilder();
  set update_user_by_pk(
          GUpdateUserData_update_user_by_pkBuilder? update_user_by_pk) =>
      _$this._update_user_by_pk = update_user_by_pk;

  GUpdateUserDataBuilder() {
    GUpdateUserData._initializeBuilder(this);
  }

  GUpdateUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _update_user_by_pk = $v.update_user_by_pk?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserData;
  }

  @override
  void update(void Function(GUpdateUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateUserData build() => _build();

  _$GUpdateUserData _build() {
    _$GUpdateUserData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateUserData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUpdateUserData', 'G__typename'),
              update_user_by_pk: _update_user_by_pk?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'update_user_by_pk';
        _update_user_by_pk?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserData_update_user_by_pk
    extends GUpdateUserData_update_user_by_pk {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final bool has_picture;

  factory _$GUpdateUserData_update_user_by_pk(
          [void Function(GUpdateUserData_update_user_by_pkBuilder)? updates]) =>
      (new GUpdateUserData_update_user_by_pkBuilder()..update(updates))
          ._build();

  _$GUpdateUserData_update_user_by_pk._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.has_picture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateUserData_update_user_by_pk', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUpdateUserData_update_user_by_pk', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUpdateUserData_update_user_by_pk', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GUpdateUserData_update_user_by_pk', 'description');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GUpdateUserData_update_user_by_pk', 'has_picture');
  }

  @override
  GUpdateUserData_update_user_by_pk rebuild(
          void Function(GUpdateUserData_update_user_by_pkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserData_update_user_by_pkBuilder toBuilder() =>
      new GUpdateUserData_update_user_by_pkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserData_update_user_by_pk &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        has_picture == other.has_picture;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, has_picture.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateUserData_update_user_by_pk')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('has_picture', has_picture))
        .toString();
  }
}

class GUpdateUserData_update_user_by_pkBuilder
    implements
        Builder<GUpdateUserData_update_user_by_pk,
            GUpdateUserData_update_user_by_pkBuilder> {
  _$GUpdateUserData_update_user_by_pk? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _has_picture;
  bool? get has_picture => _$this._has_picture;
  set has_picture(bool? has_picture) => _$this._has_picture = has_picture;

  GUpdateUserData_update_user_by_pkBuilder() {
    GUpdateUserData_update_user_by_pk._initializeBuilder(this);
  }

  GUpdateUserData_update_user_by_pkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _has_picture = $v.has_picture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserData_update_user_by_pk other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserData_update_user_by_pk;
  }

  @override
  void update(
      void Function(GUpdateUserData_update_user_by_pkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateUserData_update_user_by_pk build() => _build();

  _$GUpdateUserData_update_user_by_pk _build() {
    final _$result = _$v ??
        new _$GUpdateUserData_update_user_by_pk._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUpdateUserData_update_user_by_pk', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUpdateUserData_update_user_by_pk', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GUpdateUserData_update_user_by_pk', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(description,
                r'GUpdateUserData_update_user_by_pk', 'description'),
            has_picture: BuiltValueNullFieldError.checkNotNull(has_picture,
                r'GUpdateUserData_update_user_by_pk', 'has_picture'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
