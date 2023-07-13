// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GuserFieldsData> _$guserFieldsDataSerializer =
    new _$GuserFieldsDataSerializer();

class _$GuserFieldsDataSerializer
    implements StructuredSerializer<GuserFieldsData> {
  @override
  final Iterable<Type> types = const [GuserFieldsData, _$GuserFieldsData];
  @override
  final String wireName = 'GuserFieldsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GuserFieldsData object,
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
  GuserFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GuserFieldsDataBuilder();

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

class _$GuserFieldsData extends GuserFieldsData {
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

  factory _$GuserFieldsData([void Function(GuserFieldsDataBuilder)? updates]) =>
      (new GuserFieldsDataBuilder()..update(updates))._build();

  _$GuserFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      required this.has_picture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GuserFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GuserFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'GuserFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GuserFieldsData', 'description');
    BuiltValueNullFieldError.checkNotNull(
        has_picture, r'GuserFieldsData', 'has_picture');
  }

  @override
  GuserFieldsData rebuild(void Function(GuserFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GuserFieldsDataBuilder toBuilder() =>
      new GuserFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GuserFieldsData &&
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
    return (newBuiltValueToStringHelper(r'GuserFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('has_picture', has_picture))
        .toString();
  }
}

class GuserFieldsDataBuilder
    implements Builder<GuserFieldsData, GuserFieldsDataBuilder> {
  _$GuserFieldsData? _$v;

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

  GuserFieldsDataBuilder() {
    GuserFieldsData._initializeBuilder(this);
  }

  GuserFieldsDataBuilder get _$this {
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
  void replace(GuserFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GuserFieldsData;
  }

  @override
  void update(void Function(GuserFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GuserFieldsData build() => _build();

  _$GuserFieldsData _build() {
    final _$result = _$v ??
        new _$GuserFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GuserFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GuserFieldsData', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GuserFieldsData', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GuserFieldsData', 'description'),
            has_picture: BuiltValueNullFieldError.checkNotNull(
                has_picture, r'GuserFieldsData', 'has_picture'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
