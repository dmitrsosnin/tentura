// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GcommentFieldsData> _$gcommentFieldsDataSerializer =
    new _$GcommentFieldsDataSerializer();

class _$GcommentFieldsDataSerializer
    implements StructuredSerializer<GcommentFieldsData> {
  @override
  final Iterable<Type> types = const [GcommentFieldsData, _$GcommentFieldsData];
  @override
  final String wireName = 'GcommentFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcommentFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id,
          specifiedType: const FullType(_i1.Guuid)),
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'beacon_id',
      serializers.serialize(object.beacon_id,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.created_at,
          specifiedType: const FullType(_i1.Gtimestamptz)),
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GcommentFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcommentFieldsDataBuilder();

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
          result.id.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.Guuid))! as _i1.Guuid);
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'beacon_id':
          result.beacon_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_at':
          result.created_at.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.Gtimestamptz))!
              as _i1.Gtimestamptz);
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GcommentFieldsData extends GcommentFieldsData {
  @override
  final String G__typename;
  @override
  final _i1.Guuid id;
  @override
  final String user_id;
  @override
  final String beacon_id;
  @override
  final _i1.Gtimestamptz created_at;
  @override
  final String content;

  factory _$GcommentFieldsData(
          [void Function(GcommentFieldsDataBuilder)? updates]) =>
      (new GcommentFieldsDataBuilder()..update(updates))._build();

  _$GcommentFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.user_id,
      required this.beacon_id,
      required this.created_at,
      required this.content})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GcommentFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GcommentFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'GcommentFieldsData', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        beacon_id, r'GcommentFieldsData', 'beacon_id');
    BuiltValueNullFieldError.checkNotNull(
        created_at, r'GcommentFieldsData', 'created_at');
    BuiltValueNullFieldError.checkNotNull(
        content, r'GcommentFieldsData', 'content');
  }

  @override
  GcommentFieldsData rebuild(
          void Function(GcommentFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcommentFieldsDataBuilder toBuilder() =>
      new GcommentFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcommentFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        user_id == other.user_id &&
        beacon_id == other.beacon_id &&
        created_at == other.created_at &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, beacon_id.hashCode);
    _$hash = $jc(_$hash, created_at.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GcommentFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('user_id', user_id)
          ..add('beacon_id', beacon_id)
          ..add('created_at', created_at)
          ..add('content', content))
        .toString();
  }
}

class GcommentFieldsDataBuilder
    implements Builder<GcommentFieldsData, GcommentFieldsDataBuilder> {
  _$GcommentFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i1.GuuidBuilder? _id;
  _i1.GuuidBuilder get id => _$this._id ??= new _i1.GuuidBuilder();
  set id(_i1.GuuidBuilder? id) => _$this._id = id;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _beacon_id;
  String? get beacon_id => _$this._beacon_id;
  set beacon_id(String? beacon_id) => _$this._beacon_id = beacon_id;

  _i1.GtimestamptzBuilder? _created_at;
  _i1.GtimestamptzBuilder get created_at =>
      _$this._created_at ??= new _i1.GtimestamptzBuilder();
  set created_at(_i1.GtimestamptzBuilder? created_at) =>
      _$this._created_at = created_at;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  GcommentFieldsDataBuilder() {
    GcommentFieldsData._initializeBuilder(this);
  }

  GcommentFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id.toBuilder();
      _user_id = $v.user_id;
      _beacon_id = $v.beacon_id;
      _created_at = $v.created_at.toBuilder();
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcommentFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcommentFieldsData;
  }

  @override
  void update(void Function(GcommentFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GcommentFieldsData build() => _build();

  _$GcommentFieldsData _build() {
    _$GcommentFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GcommentFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GcommentFieldsData', 'G__typename'),
              id: id.build(),
              user_id: BuiltValueNullFieldError.checkNotNull(
                  user_id, r'GcommentFieldsData', 'user_id'),
              beacon_id: BuiltValueNullFieldError.checkNotNull(
                  beacon_id, r'GcommentFieldsData', 'beacon_id'),
              created_at: created_at.build(),
              content: BuiltValueNullFieldError.checkNotNull(
                  content, r'GcommentFieldsData', 'content'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'id';
        id.build();

        _$failedField = 'created_at';
        created_at.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GcommentFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
