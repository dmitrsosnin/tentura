// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_beacon.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSearchBeaconData> _$gSearchBeaconDataSerializer =
    new _$GSearchBeaconDataSerializer();
Serializer<GSearchBeaconData_beacon> _$gSearchBeaconDataBeaconSerializer =
    new _$GSearchBeaconData_beaconSerializer();
Serializer<GSearchBeaconData_beacon_author>
    _$gSearchBeaconDataBeaconAuthorSerializer =
    new _$GSearchBeaconData_beacon_authorSerializer();

class _$GSearchBeaconDataSerializer
    implements StructuredSerializer<GSearchBeaconData> {
  @override
  final Iterable<Type> types = const [GSearchBeaconData, _$GSearchBeaconData];
  @override
  final String wireName = 'GSearchBeaconData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSearchBeaconData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'beacon',
      serializers.serialize(object.beacon,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GSearchBeaconData_beacon)])),
    ];

    return result;
  }

  @override
  GSearchBeaconData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSearchBeaconDataBuilder();

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
        case 'beacon':
          result.beacon.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GSearchBeaconData_beacon)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchBeaconData_beaconSerializer
    implements StructuredSerializer<GSearchBeaconData_beacon> {
  @override
  final Iterable<Type> types = const [
    GSearchBeaconData_beacon,
    _$GSearchBeaconData_beacon
  ];
  @override
  final String wireName = 'GSearchBeaconData_beacon';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSearchBeaconData_beacon object,
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
      'comments_count',
      serializers.serialize(object.comments_count,
          specifiedType: const FullType(int)),
      'enabled',
      serializers.serialize(object.enabled,
          specifiedType: const FullType(bool)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GSearchBeaconData_beacon_author)),
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
  GSearchBeaconData_beacon deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSearchBeaconData_beaconBuilder();

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
        case 'comments_count':
          result.comments_count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GSearchBeaconData_beacon_author))!
              as GSearchBeaconData_beacon_author);
          break;
      }
    }

    return result.build();
  }
}

class _$GSearchBeaconData_beacon_authorSerializer
    implements StructuredSerializer<GSearchBeaconData_beacon_author> {
  @override
  final Iterable<Type> types = const [
    GSearchBeaconData_beacon_author,
    _$GSearchBeaconData_beacon_author
  ];
  @override
  final String wireName = 'GSearchBeaconData_beacon_author';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSearchBeaconData_beacon_author object,
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
  GSearchBeaconData_beacon_author deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSearchBeaconData_beacon_authorBuilder();

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

class _$GSearchBeaconData extends GSearchBeaconData {
  @override
  final String G__typename;
  @override
  final BuiltList<GSearchBeaconData_beacon> beacon;

  factory _$GSearchBeaconData(
          [void Function(GSearchBeaconDataBuilder)? updates]) =>
      (new GSearchBeaconDataBuilder()..update(updates))._build();

  _$GSearchBeaconData._({required this.G__typename, required this.beacon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSearchBeaconData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        beacon, r'GSearchBeaconData', 'beacon');
  }

  @override
  GSearchBeaconData rebuild(void Function(GSearchBeaconDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchBeaconDataBuilder toBuilder() =>
      new GSearchBeaconDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchBeaconData &&
        G__typename == other.G__typename &&
        beacon == other.beacon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, beacon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSearchBeaconData')
          ..add('G__typename', G__typename)
          ..add('beacon', beacon))
        .toString();
  }
}

class GSearchBeaconDataBuilder
    implements Builder<GSearchBeaconData, GSearchBeaconDataBuilder> {
  _$GSearchBeaconData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GSearchBeaconData_beacon>? _beacon;
  ListBuilder<GSearchBeaconData_beacon> get beacon =>
      _$this._beacon ??= new ListBuilder<GSearchBeaconData_beacon>();
  set beacon(ListBuilder<GSearchBeaconData_beacon>? beacon) =>
      _$this._beacon = beacon;

  GSearchBeaconDataBuilder() {
    GSearchBeaconData._initializeBuilder(this);
  }

  GSearchBeaconDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _beacon = $v.beacon.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchBeaconData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSearchBeaconData;
  }

  @override
  void update(void Function(GSearchBeaconDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchBeaconData build() => _build();

  _$GSearchBeaconData _build() {
    _$GSearchBeaconData _$result;
    try {
      _$result = _$v ??
          new _$GSearchBeaconData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GSearchBeaconData', 'G__typename'),
              beacon: beacon.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'beacon';
        beacon.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSearchBeaconData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSearchBeaconData_beacon extends GSearchBeaconData_beacon {
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
  final int comments_count;
  @override
  final bool enabled;
  @override
  final GSearchBeaconData_beacon_author author;

  factory _$GSearchBeaconData_beacon(
          [void Function(GSearchBeaconData_beaconBuilder)? updates]) =>
      (new GSearchBeaconData_beaconBuilder()..update(updates))._build();

  _$GSearchBeaconData_beacon._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.created_at,
      required this.updated_at,
      this.place,
      this.timerange,
      required this.has_picture,
      required this.comments_count,
      required this.enabled,
      required this.author})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSearchBeaconData_beacon', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GSearchBeaconData_beacon', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GSearchBeaconData_beacon', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GSearchBeaconData_beacon', 'description');
    BuiltValueNullFieldError.checkNotNull(
        created_at, r'GSearchBeaconData_beacon', 'created_at');
    BuiltValueNullFieldError.checkNotNull(
        updated_at, r'GSearchBeaconData_beacon', 'updated_at');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GSearchBeaconData_beacon', 'has_picture');
    BuiltValueNullFieldError.checkNotNull(
        comments_count, r'GSearchBeaconData_beacon', 'comments_count');
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'GSearchBeaconData_beacon', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        author, r'GSearchBeaconData_beacon', 'author');
  }

  @override
  GSearchBeaconData_beacon rebuild(
          void Function(GSearchBeaconData_beaconBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchBeaconData_beaconBuilder toBuilder() =>
      new GSearchBeaconData_beaconBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchBeaconData_beacon &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        created_at == other.created_at &&
        updated_at == other.updated_at &&
        place == other.place &&
        timerange == other.timerange &&
        has_picture == other.has_picture &&
        comments_count == other.comments_count &&
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
    _$hash = $jc(_$hash, comments_count.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSearchBeaconData_beacon')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at)
          ..add('place', place)
          ..add('timerange', timerange)
          ..add('has_picture', has_picture)
          ..add('comments_count', comments_count)
          ..add('enabled', enabled)
          ..add('author', author))
        .toString();
  }
}

class GSearchBeaconData_beaconBuilder
    implements
        Builder<GSearchBeaconData_beacon, GSearchBeaconData_beaconBuilder> {
  _$GSearchBeaconData_beacon? _$v;

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

  int? _comments_count;
  int? get comments_count => _$this._comments_count;
  set comments_count(int? comments_count) =>
      _$this._comments_count = comments_count;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  GSearchBeaconData_beacon_authorBuilder? _author;
  GSearchBeaconData_beacon_authorBuilder get author =>
      _$this._author ??= new GSearchBeaconData_beacon_authorBuilder();
  set author(GSearchBeaconData_beacon_authorBuilder? author) =>
      _$this._author = author;

  GSearchBeaconData_beaconBuilder() {
    GSearchBeaconData_beacon._initializeBuilder(this);
  }

  GSearchBeaconData_beaconBuilder get _$this {
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
      _comments_count = $v.comments_count;
      _enabled = $v.enabled;
      _author = $v.author.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSearchBeaconData_beacon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSearchBeaconData_beacon;
  }

  @override
  void update(void Function(GSearchBeaconData_beaconBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchBeaconData_beacon build() => _build();

  _$GSearchBeaconData_beacon _build() {
    _$GSearchBeaconData_beacon _$result;
    try {
      _$result = _$v ??
          new _$GSearchBeaconData_beacon._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GSearchBeaconData_beacon', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GSearchBeaconData_beacon', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GSearchBeaconData_beacon', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GSearchBeaconData_beacon', 'description'),
              created_at: BuiltValueNullFieldError.checkNotNull(
                  created_at, r'GSearchBeaconData_beacon', 'created_at'),
              updated_at: BuiltValueNullFieldError.checkNotNull(
                  updated_at, r'GSearchBeaconData_beacon', 'updated_at'),
              place: place,
              timerange: timerange,
              has_picture: BuiltValueNullFieldError.checkNotNull(
                  has_picture, r'GSearchBeaconData_beacon', 'has_picture'),
              comments_count: BuiltValueNullFieldError.checkNotNull(
                  comments_count, r'GSearchBeaconData_beacon', 'comments_count'),
              enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'GSearchBeaconData_beacon', 'enabled'),
              author: author.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSearchBeaconData_beacon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSearchBeaconData_beacon_author
    extends GSearchBeaconData_beacon_author {
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

  factory _$GSearchBeaconData_beacon_author(
          [void Function(GSearchBeaconData_beacon_authorBuilder)? updates]) =>
      (new GSearchBeaconData_beacon_authorBuilder()..update(updates))._build();

  _$GSearchBeaconData_beacon_author._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.has_picture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSearchBeaconData_beacon_author', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GSearchBeaconData_beacon_author', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GSearchBeaconData_beacon_author', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GSearchBeaconData_beacon_author', 'description');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GSearchBeaconData_beacon_author', 'has_picture');
  }

  @override
  GSearchBeaconData_beacon_author rebuild(
          void Function(GSearchBeaconData_beacon_authorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSearchBeaconData_beacon_authorBuilder toBuilder() =>
      new GSearchBeaconData_beacon_authorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSearchBeaconData_beacon_author &&
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
    return (newBuiltValueToStringHelper(r'GSearchBeaconData_beacon_author')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('has_picture', has_picture))
        .toString();
  }
}

class GSearchBeaconData_beacon_authorBuilder
    implements
        Builder<GSearchBeaconData_beacon_author,
            GSearchBeaconData_beacon_authorBuilder> {
  _$GSearchBeaconData_beacon_author? _$v;

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

  GSearchBeaconData_beacon_authorBuilder() {
    GSearchBeaconData_beacon_author._initializeBuilder(this);
  }

  GSearchBeaconData_beacon_authorBuilder get _$this {
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
  void replace(GSearchBeaconData_beacon_author other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSearchBeaconData_beacon_author;
  }

  @override
  void update(void Function(GSearchBeaconData_beacon_authorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSearchBeaconData_beacon_author build() => _build();

  _$GSearchBeaconData_beacon_author _build() {
    final _$result = _$v ??
        new _$GSearchBeaconData_beacon_author._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GSearchBeaconData_beacon_author', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GSearchBeaconData_beacon_author', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GSearchBeaconData_beacon_author', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GSearchBeaconData_beacon_author', 'description'),
            has_picture: BuiltValueNullFieldError.checkNotNull(has_picture,
                r'GSearchBeaconData_beacon_author', 'has_picture'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
