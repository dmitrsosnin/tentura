// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateUserData> _$gCreateUserDataSerializer =
    new _$GCreateUserDataSerializer();
Serializer<GCreateUserData_insert_user_one>
    _$gCreateUserDataInsertUserOneSerializer =
    new _$GCreateUserData_insert_user_oneSerializer();

class _$GCreateUserDataSerializer
    implements StructuredSerializer<GCreateUserData> {
  @override
  final Iterable<Type> types = const [GCreateUserData, _$GCreateUserData];
  @override
  final String wireName = 'GCreateUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.insert_user_one;
    if (value != null) {
      result
        ..add('insert_user_one')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GCreateUserData_insert_user_one)));
    }
    return result;
  }

  @override
  GCreateUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserDataBuilder();

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
        case 'insert_user_one':
          result.insert_user_one.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateUserData_insert_user_one))!
              as GCreateUserData_insert_user_one);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateUserData_insert_user_oneSerializer
    implements StructuredSerializer<GCreateUserData_insert_user_one> {
  @override
  final Iterable<Type> types = const [
    GCreateUserData_insert_user_one,
    _$GCreateUserData_insert_user_one
  ];
  @override
  final String wireName = 'GCreateUserData_insert_user_one';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateUserData_insert_user_one object,
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
  GCreateUserData_insert_user_one deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserData_insert_user_oneBuilder();

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

class _$GCreateUserData extends GCreateUserData {
  @override
  final String G__typename;
  @override
  final GCreateUserData_insert_user_one? insert_user_one;

  factory _$GCreateUserData([void Function(GCreateUserDataBuilder)? updates]) =>
      (new GCreateUserDataBuilder()..update(updates))._build();

  _$GCreateUserData._({required this.G__typename, this.insert_user_one})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateUserData', 'G__typename');
  }

  @override
  GCreateUserData rebuild(void Function(GCreateUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserDataBuilder toBuilder() =>
      new GCreateUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserData &&
        G__typename == other.G__typename &&
        insert_user_one == other.insert_user_one;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, insert_user_one.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateUserData')
          ..add('G__typename', G__typename)
          ..add('insert_user_one', insert_user_one))
        .toString();
  }
}

class GCreateUserDataBuilder
    implements Builder<GCreateUserData, GCreateUserDataBuilder> {
  _$GCreateUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateUserData_insert_user_oneBuilder? _insert_user_one;
  GCreateUserData_insert_user_oneBuilder get insert_user_one =>
      _$this._insert_user_one ??= new GCreateUserData_insert_user_oneBuilder();
  set insert_user_one(
          GCreateUserData_insert_user_oneBuilder? insert_user_one) =>
      _$this._insert_user_one = insert_user_one;

  GCreateUserDataBuilder() {
    GCreateUserData._initializeBuilder(this);
  }

  GCreateUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _insert_user_one = $v.insert_user_one?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserData;
  }

  @override
  void update(void Function(GCreateUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserData build() => _build();

  _$GCreateUserData _build() {
    _$GCreateUserData _$result;
    try {
      _$result = _$v ??
          new _$GCreateUserData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateUserData', 'G__typename'),
              insert_user_one: _insert_user_one?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'insert_user_one';
        _insert_user_one?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateUserData_insert_user_one
    extends GCreateUserData_insert_user_one {
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

  factory _$GCreateUserData_insert_user_one(
          [void Function(GCreateUserData_insert_user_oneBuilder)? updates]) =>
      (new GCreateUserData_insert_user_oneBuilder()..update(updates))._build();

  _$GCreateUserData_insert_user_one._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.has_picture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateUserData_insert_user_one', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateUserData_insert_user_one', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GCreateUserData_insert_user_one', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GCreateUserData_insert_user_one', 'description');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GCreateUserData_insert_user_one', 'has_picture');
  }

  @override
  GCreateUserData_insert_user_one rebuild(
          void Function(GCreateUserData_insert_user_oneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserData_insert_user_oneBuilder toBuilder() =>
      new GCreateUserData_insert_user_oneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserData_insert_user_one &&
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
    return (newBuiltValueToStringHelper(r'GCreateUserData_insert_user_one')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('has_picture', has_picture))
        .toString();
  }
}

class GCreateUserData_insert_user_oneBuilder
    implements
        Builder<GCreateUserData_insert_user_one,
            GCreateUserData_insert_user_oneBuilder> {
  _$GCreateUserData_insert_user_one? _$v;

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

  GCreateUserData_insert_user_oneBuilder() {
    GCreateUserData_insert_user_one._initializeBuilder(this);
  }

  GCreateUserData_insert_user_oneBuilder get _$this {
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
  void replace(GCreateUserData_insert_user_one other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserData_insert_user_one;
  }

  @override
  void update(void Function(GCreateUserData_insert_user_oneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserData_insert_user_one build() => _build();

  _$GCreateUserData_insert_user_one _build() {
    final _$result = _$v ??
        new _$GCreateUserData_insert_user_one._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateUserData_insert_user_one', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateUserData_insert_user_one', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GCreateUserData_insert_user_one', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GCreateUserData_insert_user_one', 'description'),
            has_picture: BuiltValueNullFieldError.checkNotNull(has_picture,
                r'GCreateUserData_insert_user_one', 'has_picture'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
