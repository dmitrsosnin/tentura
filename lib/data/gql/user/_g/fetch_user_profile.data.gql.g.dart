// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_user_profile.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFetchUserProfileData> _$gFetchUserProfileDataSerializer =
    new _$GFetchUserProfileDataSerializer();
Serializer<GFetchUserProfileData_user_by_pk>
    _$gFetchUserProfileDataUserByPkSerializer =
    new _$GFetchUserProfileData_user_by_pkSerializer();

class _$GFetchUserProfileDataSerializer
    implements StructuredSerializer<GFetchUserProfileData> {
  @override
  final Iterable<Type> types = const [
    GFetchUserProfileData,
    _$GFetchUserProfileData
  ];
  @override
  final String wireName = 'GFetchUserProfileData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchUserProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user_by_pk;
    if (value != null) {
      result
        ..add('user_by_pk')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFetchUserProfileData_user_by_pk)));
    }
    return result;
  }

  @override
  GFetchUserProfileData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchUserProfileDataBuilder();

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
        case 'user_by_pk':
          result.user_by_pk.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFetchUserProfileData_user_by_pk))!
              as GFetchUserProfileData_user_by_pk);
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchUserProfileData_user_by_pkSerializer
    implements StructuredSerializer<GFetchUserProfileData_user_by_pk> {
  @override
  final Iterable<Type> types = const [
    GFetchUserProfileData_user_by_pk,
    _$GFetchUserProfileData_user_by_pk
  ];
  @override
  final String wireName = 'GFetchUserProfileData_user_by_pk';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchUserProfileData_user_by_pk object,
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
  GFetchUserProfileData_user_by_pk deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchUserProfileData_user_by_pkBuilder();

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

class _$GFetchUserProfileData extends GFetchUserProfileData {
  @override
  final String G__typename;
  @override
  final GFetchUserProfileData_user_by_pk? user_by_pk;

  factory _$GFetchUserProfileData(
          [void Function(GFetchUserProfileDataBuilder)? updates]) =>
      (new GFetchUserProfileDataBuilder()..update(updates))._build();

  _$GFetchUserProfileData._({required this.G__typename, this.user_by_pk})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFetchUserProfileData', 'G__typename');
  }

  @override
  GFetchUserProfileData rebuild(
          void Function(GFetchUserProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchUserProfileDataBuilder toBuilder() =>
      new GFetchUserProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchUserProfileData &&
        G__typename == other.G__typename &&
        user_by_pk == other.user_by_pk;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, user_by_pk.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFetchUserProfileData')
          ..add('G__typename', G__typename)
          ..add('user_by_pk', user_by_pk))
        .toString();
  }
}

class GFetchUserProfileDataBuilder
    implements Builder<GFetchUserProfileData, GFetchUserProfileDataBuilder> {
  _$GFetchUserProfileData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFetchUserProfileData_user_by_pkBuilder? _user_by_pk;
  GFetchUserProfileData_user_by_pkBuilder get user_by_pk =>
      _$this._user_by_pk ??= new GFetchUserProfileData_user_by_pkBuilder();
  set user_by_pk(GFetchUserProfileData_user_by_pkBuilder? user_by_pk) =>
      _$this._user_by_pk = user_by_pk;

  GFetchUserProfileDataBuilder() {
    GFetchUserProfileData._initializeBuilder(this);
  }

  GFetchUserProfileDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user_by_pk = $v.user_by_pk?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchUserProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchUserProfileData;
  }

  @override
  void update(void Function(GFetchUserProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchUserProfileData build() => _build();

  _$GFetchUserProfileData _build() {
    _$GFetchUserProfileData _$result;
    try {
      _$result = _$v ??
          new _$GFetchUserProfileData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFetchUserProfileData', 'G__typename'),
              user_by_pk: _user_by_pk?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user_by_pk';
        _user_by_pk?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFetchUserProfileData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFetchUserProfileData_user_by_pk
    extends GFetchUserProfileData_user_by_pk {
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

  factory _$GFetchUserProfileData_user_by_pk(
          [void Function(GFetchUserProfileData_user_by_pkBuilder)? updates]) =>
      (new GFetchUserProfileData_user_by_pkBuilder()..update(updates))._build();

  _$GFetchUserProfileData_user_by_pk._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.has_picture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFetchUserProfileData_user_by_pk', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFetchUserProfileData_user_by_pk', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFetchUserProfileData_user_by_pk', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GFetchUserProfileData_user_by_pk', 'description');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GFetchUserProfileData_user_by_pk', 'has_picture');
  }

  @override
  GFetchUserProfileData_user_by_pk rebuild(
          void Function(GFetchUserProfileData_user_by_pkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchUserProfileData_user_by_pkBuilder toBuilder() =>
      new GFetchUserProfileData_user_by_pkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchUserProfileData_user_by_pk &&
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
    return (newBuiltValueToStringHelper(r'GFetchUserProfileData_user_by_pk')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('has_picture', has_picture))
        .toString();
  }
}

class GFetchUserProfileData_user_by_pkBuilder
    implements
        Builder<GFetchUserProfileData_user_by_pk,
            GFetchUserProfileData_user_by_pkBuilder> {
  _$GFetchUserProfileData_user_by_pk? _$v;

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

  GFetchUserProfileData_user_by_pkBuilder() {
    GFetchUserProfileData_user_by_pk._initializeBuilder(this);
  }

  GFetchUserProfileData_user_by_pkBuilder get _$this {
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
  void replace(GFetchUserProfileData_user_by_pk other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchUserProfileData_user_by_pk;
  }

  @override
  void update(void Function(GFetchUserProfileData_user_by_pkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchUserProfileData_user_by_pk build() => _build();

  _$GFetchUserProfileData_user_by_pk _build() {
    final _$result = _$v ??
        new _$GFetchUserProfileData_user_by_pk._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFetchUserProfileData_user_by_pk', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFetchUserProfileData_user_by_pk', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GFetchUserProfileData_user_by_pk', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(description,
                r'GFetchUserProfileData_user_by_pk', 'description'),
            has_picture: BuiltValueNullFieldError.checkNotNull(has_picture,
                r'GFetchUserProfileData_user_by_pk', 'has_picture'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
