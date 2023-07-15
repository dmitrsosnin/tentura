// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_beacon_by_user_id.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFetchBeaconsByUserIdData> _$gFetchBeaconsByUserIdDataSerializer =
    new _$GFetchBeaconsByUserIdDataSerializer();
Serializer<GFetchBeaconsByUserIdData_beacon>
    _$gFetchBeaconsByUserIdDataBeaconSerializer =
    new _$GFetchBeaconsByUserIdData_beaconSerializer();
Serializer<GFetchBeaconsByUserIdData_beacon_author>
    _$gFetchBeaconsByUserIdDataBeaconAuthorSerializer =
    new _$GFetchBeaconsByUserIdData_beacon_authorSerializer();
Serializer<GFetchBeaconsByUserIdData_beacon_comments_aggregate>
    _$gFetchBeaconsByUserIdDataBeaconCommentsAggregateSerializer =
    new _$GFetchBeaconsByUserIdData_beacon_comments_aggregateSerializer();
Serializer<GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate>
    _$gFetchBeaconsByUserIdDataBeaconCommentsAggregateAggregateSerializer =
    new _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateSerializer();

class _$GFetchBeaconsByUserIdDataSerializer
    implements StructuredSerializer<GFetchBeaconsByUserIdData> {
  @override
  final Iterable<Type> types = const [
    GFetchBeaconsByUserIdData,
    _$GFetchBeaconsByUserIdData
  ];
  @override
  final String wireName = 'GFetchBeaconsByUserIdData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchBeaconsByUserIdData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'beacon',
      serializers.serialize(object.beacon,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GFetchBeaconsByUserIdData_beacon)])),
    ];

    return result;
  }

  @override
  GFetchBeaconsByUserIdData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchBeaconsByUserIdDataBuilder();

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
                const FullType(GFetchBeaconsByUserIdData_beacon)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchBeaconsByUserIdData_beaconSerializer
    implements StructuredSerializer<GFetchBeaconsByUserIdData_beacon> {
  @override
  final Iterable<Type> types = const [
    GFetchBeaconsByUserIdData_beacon,
    _$GFetchBeaconsByUserIdData_beacon
  ];
  @override
  final String wireName = 'GFetchBeaconsByUserIdData_beacon';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchBeaconsByUserIdData_beacon object,
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
              const FullType(GFetchBeaconsByUserIdData_beacon_author)),
      'comments_aggregate',
      serializers.serialize(object.comments_aggregate,
          specifiedType: const FullType(
              GFetchBeaconsByUserIdData_beacon_comments_aggregate)),
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
  GFetchBeaconsByUserIdData_beacon deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchBeaconsByUserIdData_beaconBuilder();

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
                  specifiedType:
                      const FullType(GFetchBeaconsByUserIdData_beacon_author))!
              as GFetchBeaconsByUserIdData_beacon_author);
          break;
        case 'comments_aggregate':
          result.comments_aggregate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFetchBeaconsByUserIdData_beacon_comments_aggregate))!
              as GFetchBeaconsByUserIdData_beacon_comments_aggregate);
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchBeaconsByUserIdData_beacon_authorSerializer
    implements StructuredSerializer<GFetchBeaconsByUserIdData_beacon_author> {
  @override
  final Iterable<Type> types = const [
    GFetchBeaconsByUserIdData_beacon_author,
    _$GFetchBeaconsByUserIdData_beacon_author
  ];
  @override
  final String wireName = 'GFetchBeaconsByUserIdData_beacon_author';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchBeaconsByUserIdData_beacon_author object,
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
  GFetchBeaconsByUserIdData_beacon_author deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchBeaconsByUserIdData_beacon_authorBuilder();

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

class _$GFetchBeaconsByUserIdData_beacon_comments_aggregateSerializer
    implements
        StructuredSerializer<
            GFetchBeaconsByUserIdData_beacon_comments_aggregate> {
  @override
  final Iterable<Type> types = const [
    GFetchBeaconsByUserIdData_beacon_comments_aggregate,
    _$GFetchBeaconsByUserIdData_beacon_comments_aggregate
  ];
  @override
  final String wireName = 'GFetchBeaconsByUserIdData_beacon_comments_aggregate';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFetchBeaconsByUserIdData_beacon_comments_aggregate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.aggregate;
    if (value != null) {
      result
        ..add('aggregate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate)));
    }
    return result;
  }

  @override
  GFetchBeaconsByUserIdData_beacon_comments_aggregate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder();

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
        case 'aggregate':
          result.aggregate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate))!
              as GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate);
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateSerializer
    implements
        StructuredSerializer<
            GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate> {
  @override
  final Iterable<Type> types = const [
    GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate,
    _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate
  ];
  @override
  final String wireName =
      'GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder();

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
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchBeaconsByUserIdData extends GFetchBeaconsByUserIdData {
  @override
  final String G__typename;
  @override
  final BuiltList<GFetchBeaconsByUserIdData_beacon> beacon;

  factory _$GFetchBeaconsByUserIdData(
          [void Function(GFetchBeaconsByUserIdDataBuilder)? updates]) =>
      (new GFetchBeaconsByUserIdDataBuilder()..update(updates))._build();

  _$GFetchBeaconsByUserIdData._(
      {required this.G__typename, required this.beacon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFetchBeaconsByUserIdData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        beacon, r'GFetchBeaconsByUserIdData', 'beacon');
  }

  @override
  GFetchBeaconsByUserIdData rebuild(
          void Function(GFetchBeaconsByUserIdDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchBeaconsByUserIdDataBuilder toBuilder() =>
      new GFetchBeaconsByUserIdDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchBeaconsByUserIdData &&
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
    return (newBuiltValueToStringHelper(r'GFetchBeaconsByUserIdData')
          ..add('G__typename', G__typename)
          ..add('beacon', beacon))
        .toString();
  }
}

class GFetchBeaconsByUserIdDataBuilder
    implements
        Builder<GFetchBeaconsByUserIdData, GFetchBeaconsByUserIdDataBuilder> {
  _$GFetchBeaconsByUserIdData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFetchBeaconsByUserIdData_beacon>? _beacon;
  ListBuilder<GFetchBeaconsByUserIdData_beacon> get beacon =>
      _$this._beacon ??= new ListBuilder<GFetchBeaconsByUserIdData_beacon>();
  set beacon(ListBuilder<GFetchBeaconsByUserIdData_beacon>? beacon) =>
      _$this._beacon = beacon;

  GFetchBeaconsByUserIdDataBuilder() {
    GFetchBeaconsByUserIdData._initializeBuilder(this);
  }

  GFetchBeaconsByUserIdDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _beacon = $v.beacon.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchBeaconsByUserIdData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchBeaconsByUserIdData;
  }

  @override
  void update(void Function(GFetchBeaconsByUserIdDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchBeaconsByUserIdData build() => _build();

  _$GFetchBeaconsByUserIdData _build() {
    _$GFetchBeaconsByUserIdData _$result;
    try {
      _$result = _$v ??
          new _$GFetchBeaconsByUserIdData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFetchBeaconsByUserIdData', 'G__typename'),
              beacon: beacon.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'beacon';
        beacon.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFetchBeaconsByUserIdData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFetchBeaconsByUserIdData_beacon
    extends GFetchBeaconsByUserIdData_beacon {
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
  final GFetchBeaconsByUserIdData_beacon_author author;
  @override
  final GFetchBeaconsByUserIdData_beacon_comments_aggregate comments_aggregate;

  factory _$GFetchBeaconsByUserIdData_beacon(
          [void Function(GFetchBeaconsByUserIdData_beaconBuilder)? updates]) =>
      (new GFetchBeaconsByUserIdData_beaconBuilder()..update(updates))._build();

  _$GFetchBeaconsByUserIdData_beacon._(
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
      required this.author,
      required this.comments_aggregate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFetchBeaconsByUserIdData_beacon', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFetchBeaconsByUserIdData_beacon', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFetchBeaconsByUserIdData_beacon', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GFetchBeaconsByUserIdData_beacon', 'description');
    BuiltValueNullFieldError.checkNotNull(
        created_at, r'GFetchBeaconsByUserIdData_beacon', 'created_at');
    BuiltValueNullFieldError.checkNotNull(
        updated_at, r'GFetchBeaconsByUserIdData_beacon', 'updated_at');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GFetchBeaconsByUserIdData_beacon', 'has_picture');
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'GFetchBeaconsByUserIdData_beacon', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        author, r'GFetchBeaconsByUserIdData_beacon', 'author');
    BuiltValueNullFieldError.checkNotNull(comments_aggregate,
        r'GFetchBeaconsByUserIdData_beacon', 'comments_aggregate');
  }

  @override
  GFetchBeaconsByUserIdData_beacon rebuild(
          void Function(GFetchBeaconsByUserIdData_beaconBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchBeaconsByUserIdData_beaconBuilder toBuilder() =>
      new GFetchBeaconsByUserIdData_beaconBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchBeaconsByUserIdData_beacon &&
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
        author == other.author &&
        comments_aggregate == other.comments_aggregate;
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
    _$hash = $jc(_$hash, comments_aggregate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFetchBeaconsByUserIdData_beacon')
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
          ..add('author', author)
          ..add('comments_aggregate', comments_aggregate))
        .toString();
  }
}

class GFetchBeaconsByUserIdData_beaconBuilder
    implements
        Builder<GFetchBeaconsByUserIdData_beacon,
            GFetchBeaconsByUserIdData_beaconBuilder> {
  _$GFetchBeaconsByUserIdData_beacon? _$v;

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

  GFetchBeaconsByUserIdData_beacon_authorBuilder? _author;
  GFetchBeaconsByUserIdData_beacon_authorBuilder get author =>
      _$this._author ??= new GFetchBeaconsByUserIdData_beacon_authorBuilder();
  set author(GFetchBeaconsByUserIdData_beacon_authorBuilder? author) =>
      _$this._author = author;

  GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder?
      _comments_aggregate;
  GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder
      get comments_aggregate => _$this._comments_aggregate ??=
          new GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder();
  set comments_aggregate(
          GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder?
              comments_aggregate) =>
      _$this._comments_aggregate = comments_aggregate;

  GFetchBeaconsByUserIdData_beaconBuilder() {
    GFetchBeaconsByUserIdData_beacon._initializeBuilder(this);
  }

  GFetchBeaconsByUserIdData_beaconBuilder get _$this {
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
      _comments_aggregate = $v.comments_aggregate.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchBeaconsByUserIdData_beacon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchBeaconsByUserIdData_beacon;
  }

  @override
  void update(void Function(GFetchBeaconsByUserIdData_beaconBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchBeaconsByUserIdData_beacon build() => _build();

  _$GFetchBeaconsByUserIdData_beacon _build() {
    _$GFetchBeaconsByUserIdData_beacon _$result;
    try {
      _$result = _$v ??
          new _$GFetchBeaconsByUserIdData_beacon._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFetchBeaconsByUserIdData_beacon', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFetchBeaconsByUserIdData_beacon', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFetchBeaconsByUserIdData_beacon', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GFetchBeaconsByUserIdData_beacon', 'description'),
              created_at: BuiltValueNullFieldError.checkNotNull(
                  created_at, r'GFetchBeaconsByUserIdData_beacon', 'created_at'),
              updated_at: BuiltValueNullFieldError.checkNotNull(
                  updated_at, r'GFetchBeaconsByUserIdData_beacon', 'updated_at'),
              place: place,
              timerange: timerange,
              has_picture: BuiltValueNullFieldError.checkNotNull(
                  has_picture, r'GFetchBeaconsByUserIdData_beacon', 'has_picture'),
              enabled:
                  BuiltValueNullFieldError.checkNotNull(enabled, r'GFetchBeaconsByUserIdData_beacon', 'enabled'),
              author: author.build(),
              comments_aggregate: comments_aggregate.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
        _$failedField = 'comments_aggregate';
        comments_aggregate.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFetchBeaconsByUserIdData_beacon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFetchBeaconsByUserIdData_beacon_author
    extends GFetchBeaconsByUserIdData_beacon_author {
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

  factory _$GFetchBeaconsByUserIdData_beacon_author(
          [void Function(GFetchBeaconsByUserIdData_beacon_authorBuilder)?
              updates]) =>
      (new GFetchBeaconsByUserIdData_beacon_authorBuilder()..update(updates))
          ._build();

  _$GFetchBeaconsByUserIdData_beacon_author._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.has_picture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFetchBeaconsByUserIdData_beacon_author', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFetchBeaconsByUserIdData_beacon_author', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFetchBeaconsByUserIdData_beacon_author', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GFetchBeaconsByUserIdData_beacon_author', 'description');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GFetchBeaconsByUserIdData_beacon_author', 'has_picture');
  }

  @override
  GFetchBeaconsByUserIdData_beacon_author rebuild(
          void Function(GFetchBeaconsByUserIdData_beacon_authorBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchBeaconsByUserIdData_beacon_authorBuilder toBuilder() =>
      new GFetchBeaconsByUserIdData_beacon_authorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchBeaconsByUserIdData_beacon_author &&
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
            r'GFetchBeaconsByUserIdData_beacon_author')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('has_picture', has_picture))
        .toString();
  }
}

class GFetchBeaconsByUserIdData_beacon_authorBuilder
    implements
        Builder<GFetchBeaconsByUserIdData_beacon_author,
            GFetchBeaconsByUserIdData_beacon_authorBuilder> {
  _$GFetchBeaconsByUserIdData_beacon_author? _$v;

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

  GFetchBeaconsByUserIdData_beacon_authorBuilder() {
    GFetchBeaconsByUserIdData_beacon_author._initializeBuilder(this);
  }

  GFetchBeaconsByUserIdData_beacon_authorBuilder get _$this {
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
  void replace(GFetchBeaconsByUserIdData_beacon_author other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchBeaconsByUserIdData_beacon_author;
  }

  @override
  void update(
      void Function(GFetchBeaconsByUserIdData_beacon_authorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchBeaconsByUserIdData_beacon_author build() => _build();

  _$GFetchBeaconsByUserIdData_beacon_author _build() {
    final _$result = _$v ??
        new _$GFetchBeaconsByUserIdData_beacon_author._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFetchBeaconsByUserIdData_beacon_author', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFetchBeaconsByUserIdData_beacon_author', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GFetchBeaconsByUserIdData_beacon_author', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(description,
                r'GFetchBeaconsByUserIdData_beacon_author', 'description'),
            has_picture: BuiltValueNullFieldError.checkNotNull(has_picture,
                r'GFetchBeaconsByUserIdData_beacon_author', 'has_picture'));
    replace(_$result);
    return _$result;
  }
}

class _$GFetchBeaconsByUserIdData_beacon_comments_aggregate
    extends GFetchBeaconsByUserIdData_beacon_comments_aggregate {
  @override
  final String G__typename;
  @override
  final GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate?
      aggregate;

  factory _$GFetchBeaconsByUserIdData_beacon_comments_aggregate(
          [void Function(
                  GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder)?
              updates]) =>
      (new GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder()
            ..update(updates))
          ._build();

  _$GFetchBeaconsByUserIdData_beacon_comments_aggregate._(
      {required this.G__typename, this.aggregate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFetchBeaconsByUserIdData_beacon_comments_aggregate', 'G__typename');
  }

  @override
  GFetchBeaconsByUserIdData_beacon_comments_aggregate rebuild(
          void Function(
                  GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder toBuilder() =>
      new GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchBeaconsByUserIdData_beacon_comments_aggregate &&
        G__typename == other.G__typename &&
        aggregate == other.aggregate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, aggregate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFetchBeaconsByUserIdData_beacon_comments_aggregate')
          ..add('G__typename', G__typename)
          ..add('aggregate', aggregate))
        .toString();
  }
}

class GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder
    implements
        Builder<GFetchBeaconsByUserIdData_beacon_comments_aggregate,
            GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder> {
  _$GFetchBeaconsByUserIdData_beacon_comments_aggregate? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder?
      _aggregate;
  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder
      get aggregate => _$this._aggregate ??=
          new GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder();
  set aggregate(
          GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder?
              aggregate) =>
      _$this._aggregate = aggregate;

  GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder() {
    GFetchBeaconsByUserIdData_beacon_comments_aggregate._initializeBuilder(
        this);
  }

  GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _aggregate = $v.aggregate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchBeaconsByUserIdData_beacon_comments_aggregate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchBeaconsByUserIdData_beacon_comments_aggregate;
  }

  @override
  void update(
      void Function(GFetchBeaconsByUserIdData_beacon_comments_aggregateBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchBeaconsByUserIdData_beacon_comments_aggregate build() => _build();

  _$GFetchBeaconsByUserIdData_beacon_comments_aggregate _build() {
    _$GFetchBeaconsByUserIdData_beacon_comments_aggregate _$result;
    try {
      _$result = _$v ??
          new _$GFetchBeaconsByUserIdData_beacon_comments_aggregate._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GFetchBeaconsByUserIdData_beacon_comments_aggregate',
                  'G__typename'),
              aggregate: _aggregate?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'aggregate';
        _aggregate?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFetchBeaconsByUserIdData_beacon_comments_aggregate',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate
    extends GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate {
  @override
  final String G__typename;
  @override
  final int count;

  factory _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate(
          [void Function(
                  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder)?
              updates]) =>
      (new GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder()
            ..update(updates))
          ._build();

  _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate._(
      {required this.G__typename, required this.count})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        count,
        r'GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate',
        'count');
  }

  @override
  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate rebuild(
          void Function(
                  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder
      toBuilder() =>
          new GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate &&
        G__typename == other.G__typename &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate')
          ..add('G__typename', G__typename)
          ..add('count', count))
        .toString();
  }
}

class GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder
    implements
        Builder<GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate,
            GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder> {
  _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder() {
    GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate
        ._initializeBuilder(this);
  }

  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate;
  }

  @override
  void update(
      void Function(
              GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregateBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate build() =>
      _build();

  _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate _build() {
    final _$result = _$v ??
        new _$GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate',
                'G__typename'),
            count: BuiltValueNullFieldError.checkNotNull(
                count,
                r'GFetchBeaconsByUserIdData_beacon_comments_aggregate_aggregate',
                'count'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
