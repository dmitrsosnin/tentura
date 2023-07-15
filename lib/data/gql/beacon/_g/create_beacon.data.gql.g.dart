// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_beacon.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateBeaconData> _$gCreateBeaconDataSerializer =
    new _$GCreateBeaconDataSerializer();
Serializer<GCreateBeaconData_insert_beacon_one>
    _$gCreateBeaconDataInsertBeaconOneSerializer =
    new _$GCreateBeaconData_insert_beacon_oneSerializer();
Serializer<GCreateBeaconData_insert_beacon_one_author>
    _$gCreateBeaconDataInsertBeaconOneAuthorSerializer =
    new _$GCreateBeaconData_insert_beacon_one_authorSerializer();

class _$GCreateBeaconDataSerializer
    implements StructuredSerializer<GCreateBeaconData> {
  @override
  final Iterable<Type> types = const [GCreateBeaconData, _$GCreateBeaconData];
  @override
  final String wireName = 'GCreateBeaconData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateBeaconData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.insert_beacon_one;
    if (value != null) {
      result
        ..add('insert_beacon_one')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GCreateBeaconData_insert_beacon_one)));
    }
    return result;
  }

  @override
  GCreateBeaconData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateBeaconDataBuilder();

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
        case 'insert_beacon_one':
          result.insert_beacon_one.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateBeaconData_insert_beacon_one))!
              as GCreateBeaconData_insert_beacon_one);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateBeaconData_insert_beacon_oneSerializer
    implements StructuredSerializer<GCreateBeaconData_insert_beacon_one> {
  @override
  final Iterable<Type> types = const [
    GCreateBeaconData_insert_beacon_one,
    _$GCreateBeaconData_insert_beacon_one
  ];
  @override
  final String wireName = 'GCreateBeaconData_insert_beacon_one';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateBeaconData_insert_beacon_one object,
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
          specifiedType:
              const FullType(GCreateBeaconData_insert_beacon_one_author)),
    ];
    Object? value;
    value = object.place;
    if (value != null) {
      result
        ..add('place')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i3.LatLng)));
    }
    value = object.timerange;
    if (value != null) {
      result
        ..add('timerange')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i4.DateTimeRange)));
    }
    return result;
  }

  @override
  GCreateBeaconData_insert_beacon_one deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateBeaconData_insert_beacon_oneBuilder();

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
              specifiedType: const FullType(_i3.LatLng)) as _i3.LatLng?;
          break;
        case 'timerange':
          result.timerange = serializers.deserialize(value,
                  specifiedType: const FullType(_i4.DateTimeRange))
              as _i4.DateTimeRange?;
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
                  specifiedType: const FullType(
                      GCreateBeaconData_insert_beacon_one_author))!
              as GCreateBeaconData_insert_beacon_one_author);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateBeaconData_insert_beacon_one_authorSerializer
    implements
        StructuredSerializer<GCreateBeaconData_insert_beacon_one_author> {
  @override
  final Iterable<Type> types = const [
    GCreateBeaconData_insert_beacon_one_author,
    _$GCreateBeaconData_insert_beacon_one_author
  ];
  @override
  final String wireName = 'GCreateBeaconData_insert_beacon_one_author';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GCreateBeaconData_insert_beacon_one_author object,
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
  GCreateBeaconData_insert_beacon_one_author deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateBeaconData_insert_beacon_one_authorBuilder();

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

class _$GCreateBeaconData extends GCreateBeaconData {
  @override
  final String G__typename;
  @override
  final GCreateBeaconData_insert_beacon_one? insert_beacon_one;

  factory _$GCreateBeaconData(
          [void Function(GCreateBeaconDataBuilder)? updates]) =>
      (new GCreateBeaconDataBuilder()..update(updates))._build();

  _$GCreateBeaconData._({required this.G__typename, this.insert_beacon_one})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateBeaconData', 'G__typename');
  }

  @override
  GCreateBeaconData rebuild(void Function(GCreateBeaconDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateBeaconDataBuilder toBuilder() =>
      new GCreateBeaconDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateBeaconData &&
        G__typename == other.G__typename &&
        insert_beacon_one == other.insert_beacon_one;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, insert_beacon_one.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateBeaconData')
          ..add('G__typename', G__typename)
          ..add('insert_beacon_one', insert_beacon_one))
        .toString();
  }
}

class GCreateBeaconDataBuilder
    implements Builder<GCreateBeaconData, GCreateBeaconDataBuilder> {
  _$GCreateBeaconData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateBeaconData_insert_beacon_oneBuilder? _insert_beacon_one;
  GCreateBeaconData_insert_beacon_oneBuilder get insert_beacon_one =>
      _$this._insert_beacon_one ??=
          new GCreateBeaconData_insert_beacon_oneBuilder();
  set insert_beacon_one(
          GCreateBeaconData_insert_beacon_oneBuilder? insert_beacon_one) =>
      _$this._insert_beacon_one = insert_beacon_one;

  GCreateBeaconDataBuilder() {
    GCreateBeaconData._initializeBuilder(this);
  }

  GCreateBeaconDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _insert_beacon_one = $v.insert_beacon_one?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateBeaconData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateBeaconData;
  }

  @override
  void update(void Function(GCreateBeaconDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateBeaconData build() => _build();

  _$GCreateBeaconData _build() {
    _$GCreateBeaconData _$result;
    try {
      _$result = _$v ??
          new _$GCreateBeaconData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateBeaconData', 'G__typename'),
              insert_beacon_one: _insert_beacon_one?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'insert_beacon_one';
        _insert_beacon_one?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateBeaconData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateBeaconData_insert_beacon_one
    extends GCreateBeaconData_insert_beacon_one {
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
  final _i3.LatLng? place;
  @override
  final _i4.DateTimeRange? timerange;
  @override
  final bool has_picture;
  @override
  final bool enabled;
  @override
  final GCreateBeaconData_insert_beacon_one_author author;

  factory _$GCreateBeaconData_insert_beacon_one(
          [void Function(GCreateBeaconData_insert_beacon_oneBuilder)?
              updates]) =>
      (new GCreateBeaconData_insert_beacon_oneBuilder()..update(updates))
          ._build();

  _$GCreateBeaconData_insert_beacon_one._(
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
        G__typename, r'GCreateBeaconData_insert_beacon_one', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateBeaconData_insert_beacon_one', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GCreateBeaconData_insert_beacon_one', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GCreateBeaconData_insert_beacon_one', 'description');
    BuiltValueNullFieldError.checkNotNull(
        created_at, r'GCreateBeaconData_insert_beacon_one', 'created_at');
    BuiltValueNullFieldError.checkNotNull(
        updated_at, r'GCreateBeaconData_insert_beacon_one', 'updated_at');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GCreateBeaconData_insert_beacon_one', 'has_picture');
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'GCreateBeaconData_insert_beacon_one', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        author, r'GCreateBeaconData_insert_beacon_one', 'author');
  }

  @override
  GCreateBeaconData_insert_beacon_one rebuild(
          void Function(GCreateBeaconData_insert_beacon_oneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateBeaconData_insert_beacon_oneBuilder toBuilder() =>
      new GCreateBeaconData_insert_beacon_oneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateBeaconData_insert_beacon_one &&
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
    return (newBuiltValueToStringHelper(r'GCreateBeaconData_insert_beacon_one')
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

class GCreateBeaconData_insert_beacon_oneBuilder
    implements
        Builder<GCreateBeaconData_insert_beacon_one,
            GCreateBeaconData_insert_beacon_oneBuilder> {
  _$GCreateBeaconData_insert_beacon_one? _$v;

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

  _i3.LatLng? _place;
  _i3.LatLng? get place => _$this._place;
  set place(_i3.LatLng? place) => _$this._place = place;

  _i4.DateTimeRange? _timerange;
  _i4.DateTimeRange? get timerange => _$this._timerange;
  set timerange(_i4.DateTimeRange? timerange) => _$this._timerange = timerange;

  bool? _has_picture;
  bool? get has_picture => _$this._has_picture;
  set has_picture(bool? has_picture) => _$this._has_picture = has_picture;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  GCreateBeaconData_insert_beacon_one_authorBuilder? _author;
  GCreateBeaconData_insert_beacon_one_authorBuilder get author =>
      _$this._author ??=
          new GCreateBeaconData_insert_beacon_one_authorBuilder();
  set author(GCreateBeaconData_insert_beacon_one_authorBuilder? author) =>
      _$this._author = author;

  GCreateBeaconData_insert_beacon_oneBuilder() {
    GCreateBeaconData_insert_beacon_one._initializeBuilder(this);
  }

  GCreateBeaconData_insert_beacon_oneBuilder get _$this {
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
  void replace(GCreateBeaconData_insert_beacon_one other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateBeaconData_insert_beacon_one;
  }

  @override
  void update(
      void Function(GCreateBeaconData_insert_beacon_oneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateBeaconData_insert_beacon_one build() => _build();

  _$GCreateBeaconData_insert_beacon_one _build() {
    _$GCreateBeaconData_insert_beacon_one _$result;
    try {
      _$result = _$v ??
          new _$GCreateBeaconData_insert_beacon_one._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateBeaconData_insert_beacon_one', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GCreateBeaconData_insert_beacon_one', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GCreateBeaconData_insert_beacon_one', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GCreateBeaconData_insert_beacon_one', 'description'),
              created_at: BuiltValueNullFieldError.checkNotNull(
                  created_at, r'GCreateBeaconData_insert_beacon_one', 'created_at'),
              updated_at: BuiltValueNullFieldError.checkNotNull(
                  updated_at, r'GCreateBeaconData_insert_beacon_one', 'updated_at'),
              place: place,
              timerange: timerange,
              has_picture: BuiltValueNullFieldError.checkNotNull(has_picture,
                  r'GCreateBeaconData_insert_beacon_one', 'has_picture'),
              enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'GCreateBeaconData_insert_beacon_one', 'enabled'),
              author: author.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateBeaconData_insert_beacon_one',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateBeaconData_insert_beacon_one_author
    extends GCreateBeaconData_insert_beacon_one_author {
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

  factory _$GCreateBeaconData_insert_beacon_one_author(
          [void Function(GCreateBeaconData_insert_beacon_one_authorBuilder)?
              updates]) =>
      (new GCreateBeaconData_insert_beacon_one_authorBuilder()..update(updates))
          ._build();

  _$GCreateBeaconData_insert_beacon_one_author._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.has_picture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GCreateBeaconData_insert_beacon_one_author', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateBeaconData_insert_beacon_one_author', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GCreateBeaconData_insert_beacon_one_author', 'title');
    BuiltValueNullFieldError.checkNotNull(description,
        r'GCreateBeaconData_insert_beacon_one_author', 'description');
    BuiltValueNullFieldError.checkNotNull(has_picture,
        r'GCreateBeaconData_insert_beacon_one_author', 'has_picture');
  }

  @override
  GCreateBeaconData_insert_beacon_one_author rebuild(
          void Function(GCreateBeaconData_insert_beacon_one_authorBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateBeaconData_insert_beacon_one_authorBuilder toBuilder() =>
      new GCreateBeaconData_insert_beacon_one_authorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateBeaconData_insert_beacon_one_author &&
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
    return (newBuiltValueToStringHelper(
            r'GCreateBeaconData_insert_beacon_one_author')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('has_picture', has_picture))
        .toString();
  }
}

class GCreateBeaconData_insert_beacon_one_authorBuilder
    implements
        Builder<GCreateBeaconData_insert_beacon_one_author,
            GCreateBeaconData_insert_beacon_one_authorBuilder> {
  _$GCreateBeaconData_insert_beacon_one_author? _$v;

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

  GCreateBeaconData_insert_beacon_one_authorBuilder() {
    GCreateBeaconData_insert_beacon_one_author._initializeBuilder(this);
  }

  GCreateBeaconData_insert_beacon_one_authorBuilder get _$this {
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
  void replace(GCreateBeaconData_insert_beacon_one_author other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateBeaconData_insert_beacon_one_author;
  }

  @override
  void update(
      void Function(GCreateBeaconData_insert_beacon_one_authorBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateBeaconData_insert_beacon_one_author build() => _build();

  _$GCreateBeaconData_insert_beacon_one_author _build() {
    final _$result = _$v ??
        new _$GCreateBeaconData_insert_beacon_one_author._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateBeaconData_insert_beacon_one_author', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateBeaconData_insert_beacon_one_author', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GCreateBeaconData_insert_beacon_one_author', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(description,
                r'GCreateBeaconData_insert_beacon_one_author', 'description'),
            has_picture: BuiltValueNullFieldError.checkNotNull(has_picture,
                r'GCreateBeaconData_insert_beacon_one_author', 'has_picture'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
