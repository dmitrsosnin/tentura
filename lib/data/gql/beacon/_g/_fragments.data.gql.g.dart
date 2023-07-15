// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GbeaconFieldsData> _$gbeaconFieldsDataSerializer =
    new _$GbeaconFieldsDataSerializer();
Serializer<GbeaconFieldsData_author> _$gbeaconFieldsDataAuthorSerializer =
    new _$GbeaconFieldsData_authorSerializer();

class _$GbeaconFieldsDataSerializer
    implements StructuredSerializer<GbeaconFieldsData> {
  @override
  final Iterable<Type> types = const [GbeaconFieldsData, _$GbeaconFieldsData];
  @override
  final String wireName = 'GbeaconFieldsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GbeaconFieldsData object,
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
      'created_at',
      serializers.serialize(object.created_at,
          specifiedType: const FullType(DateTime)),
      'updated_at',
      serializers.serialize(object.updated_at,
          specifiedType: const FullType(DateTime)),
      'has_picture',
      serializers.serialize(object.has_picture,
          specifiedType: const FullType(bool)),
      'enabled',
      serializers.serialize(object.enabled,
          specifiedType: const FullType(bool)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GbeaconFieldsData_author)),
    ];
    Object? value;
    value = object.place;
    if (value != null) {
      result
        ..add('place')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.LatLng)));
    }
    value = object.timerange;
    if (value != null) {
      result
        ..add('timerange')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.DateTimeRange)));
    }
    return result;
  }

  @override
  GbeaconFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GbeaconFieldsDataBuilder();

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
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'place':
          result.place = serializers.deserialize(value,
              specifiedType: const FullType(_i1.LatLng)) as _i1.LatLng?;
          break;
        case 'timerange':
          result.timerange = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.DateTimeRange))
              as _i2.DateTimeRange?;
          break;
        case 'has_picture':
          result.has_picture = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GbeaconFieldsData_author))!
              as GbeaconFieldsData_author);
          break;
      }
    }

    return result.build();
  }
}

class _$GbeaconFieldsData_authorSerializer
    implements StructuredSerializer<GbeaconFieldsData_author> {
  @override
  final Iterable<Type> types = const [
    GbeaconFieldsData_author,
    _$GbeaconFieldsData_author
  ];
  @override
  final String wireName = 'GbeaconFieldsData_author';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GbeaconFieldsData_author object,
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
  GbeaconFieldsData_author deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GbeaconFieldsData_authorBuilder();

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

class _$GbeaconFieldsData extends GbeaconFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime created_at;
  @override
  final DateTime updated_at;
  @override
  final _i1.LatLng? place;
  @override
  final _i2.DateTimeRange? timerange;
  @override
  final bool has_picture;
  @override
  final bool enabled;
  @override
  final GbeaconFieldsData_author author;

  factory _$GbeaconFieldsData(
          [void Function(GbeaconFieldsDataBuilder)? updates]) =>
      (new GbeaconFieldsDataBuilder()..update(updates))._build();

  _$GbeaconFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.created_at,
      required this.updated_at,
      this.place,
      this.timerange,
      required this.has_picture,
      required this.enabled,
      required this.author})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GbeaconFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GbeaconFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'GbeaconFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GbeaconFieldsData', 'description');
    BuiltValueNullFieldError.checkNotNull(
        created_at, r'GbeaconFieldsData', 'created_at');
    BuiltValueNullFieldError.checkNotNull(
        updated_at, r'GbeaconFieldsData', 'updated_at');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GbeaconFieldsData', 'has_picture');
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'GbeaconFieldsData', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        author, r'GbeaconFieldsData', 'author');
  }

  @override
  GbeaconFieldsData rebuild(void Function(GbeaconFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GbeaconFieldsDataBuilder toBuilder() =>
      new GbeaconFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GbeaconFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        created_at == other.created_at &&
        updated_at == other.updated_at &&
        place == other.place &&
        timerange == other.timerange &&
        has_picture == other.has_picture &&
        enabled == other.enabled &&
        author == other.author;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, created_at.hashCode);
    _$hash = $jc(_$hash, updated_at.hashCode);
    _$hash = $jc(_$hash, place.hashCode);
    _$hash = $jc(_$hash, timerange.hashCode);
    _$hash = $jc(_$hash, has_picture.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GbeaconFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at)
          ..add('place', place)
          ..add('timerange', timerange)
          ..add('has_picture', has_picture)
          ..add('enabled', enabled)
          ..add('author', author))
        .toString();
  }
}

class GbeaconFieldsDataBuilder
    implements Builder<GbeaconFieldsData, GbeaconFieldsDataBuilder> {
  _$GbeaconFieldsData? _$v;

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

  DateTime? _created_at;
  DateTime? get created_at => _$this._created_at;
  set created_at(DateTime? created_at) => _$this._created_at = created_at;

  DateTime? _updated_at;
  DateTime? get updated_at => _$this._updated_at;
  set updated_at(DateTime? updated_at) => _$this._updated_at = updated_at;

  _i1.LatLng? _place;
  _i1.LatLng? get place => _$this._place;
  set place(_i1.LatLng? place) => _$this._place = place;

  _i2.DateTimeRange? _timerange;
  _i2.DateTimeRange? get timerange => _$this._timerange;
  set timerange(_i2.DateTimeRange? timerange) => _$this._timerange = timerange;

  bool? _has_picture;
  bool? get has_picture => _$this._has_picture;
  set has_picture(bool? has_picture) => _$this._has_picture = has_picture;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  GbeaconFieldsData_authorBuilder? _author;
  GbeaconFieldsData_authorBuilder get author =>
      _$this._author ??= new GbeaconFieldsData_authorBuilder();
  set author(GbeaconFieldsData_authorBuilder? author) =>
      _$this._author = author;

  GbeaconFieldsDataBuilder() {
    GbeaconFieldsData._initializeBuilder(this);
  }

  GbeaconFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _place = $v.place;
      _timerange = $v.timerange;
      _has_picture = $v.has_picture;
      _enabled = $v.enabled;
      _author = $v.author.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GbeaconFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GbeaconFieldsData;
  }

  @override
  void update(void Function(GbeaconFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GbeaconFieldsData build() => _build();

  _$GbeaconFieldsData _build() {
    _$GbeaconFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GbeaconFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GbeaconFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GbeaconFieldsData', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GbeaconFieldsData', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GbeaconFieldsData', 'description'),
              created_at: BuiltValueNullFieldError.checkNotNull(
                  created_at, r'GbeaconFieldsData', 'created_at'),
              updated_at: BuiltValueNullFieldError.checkNotNull(
                  updated_at, r'GbeaconFieldsData', 'updated_at'),
              place: place,
              timerange: timerange,
              has_picture: BuiltValueNullFieldError.checkNotNull(
                  has_picture, r'GbeaconFieldsData', 'has_picture'),
              enabled: BuiltValueNullFieldError.checkNotNull(
                  enabled, r'GbeaconFieldsData', 'enabled'),
              author: author.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GbeaconFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GbeaconFieldsData_author extends GbeaconFieldsData_author {
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

  factory _$GbeaconFieldsData_author(
          [void Function(GbeaconFieldsData_authorBuilder)? updates]) =>
      (new GbeaconFieldsData_authorBuilder()..update(updates))._build();

  _$GbeaconFieldsData_author._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.has_picture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GbeaconFieldsData_author', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GbeaconFieldsData_author', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GbeaconFieldsData_author', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GbeaconFieldsData_author', 'description');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GbeaconFieldsData_author', 'has_picture');
  }

  @override
  GbeaconFieldsData_author rebuild(
          void Function(GbeaconFieldsData_authorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GbeaconFieldsData_authorBuilder toBuilder() =>
      new GbeaconFieldsData_authorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GbeaconFieldsData_author &&
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
    return (newBuiltValueToStringHelper(r'GbeaconFieldsData_author')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('has_picture', has_picture))
        .toString();
  }
}

class GbeaconFieldsData_authorBuilder
    implements
        Builder<GbeaconFieldsData_author, GbeaconFieldsData_authorBuilder> {
  _$GbeaconFieldsData_author? _$v;

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

  GbeaconFieldsData_authorBuilder() {
    GbeaconFieldsData_author._initializeBuilder(this);
  }

  GbeaconFieldsData_authorBuilder get _$this {
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
  void replace(GbeaconFieldsData_author other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GbeaconFieldsData_author;
  }

  @override
  void update(void Function(GbeaconFieldsData_authorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GbeaconFieldsData_author build() => _build();

  _$GbeaconFieldsData_author _build() {
    final _$result = _$v ??
        new _$GbeaconFieldsData_author._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GbeaconFieldsData_author', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GbeaconFieldsData_author', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GbeaconFieldsData_author', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GbeaconFieldsData_author', 'description'),
            has_picture: BuiltValueNullFieldError.checkNotNull(
                has_picture, r'GbeaconFieldsData_author', 'has_picture'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
