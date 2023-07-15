// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_comments_by_beacon_id.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFetchCommentsByBeaconIdData>
    _$gFetchCommentsByBeaconIdDataSerializer =
    new _$GFetchCommentsByBeaconIdDataSerializer();
Serializer<GFetchCommentsByBeaconIdData_comment>
    _$gFetchCommentsByBeaconIdDataCommentSerializer =
    new _$GFetchCommentsByBeaconIdData_commentSerializer();
Serializer<GFetchCommentsByBeaconIdData_comment_author>
    _$gFetchCommentsByBeaconIdDataCommentAuthorSerializer =
    new _$GFetchCommentsByBeaconIdData_comment_authorSerializer();

class _$GFetchCommentsByBeaconIdDataSerializer
    implements StructuredSerializer<GFetchCommentsByBeaconIdData> {
  @override
  final Iterable<Type> types = const [
    GFetchCommentsByBeaconIdData,
    _$GFetchCommentsByBeaconIdData
  ];
  @override
  final String wireName = 'GFetchCommentsByBeaconIdData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchCommentsByBeaconIdData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'comment',
      serializers.serialize(object.comment,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GFetchCommentsByBeaconIdData_comment)])),
    ];

    return result;
  }

  @override
  GFetchCommentsByBeaconIdData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchCommentsByBeaconIdDataBuilder();

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
        case 'comment':
          result.comment.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFetchCommentsByBeaconIdData_comment)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchCommentsByBeaconIdData_commentSerializer
    implements StructuredSerializer<GFetchCommentsByBeaconIdData_comment> {
  @override
  final Iterable<Type> types = const [
    GFetchCommentsByBeaconIdData_comment,
    _$GFetchCommentsByBeaconIdData_comment
  ];
  @override
  final String wireName = 'GFetchCommentsByBeaconIdData_comment';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchCommentsByBeaconIdData_comment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'beacon_id',
      serializers.serialize(object.beacon_id,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.created_at,
          specifiedType: const FullType(DateTime)),
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType:
              const FullType(GFetchCommentsByBeaconIdData_comment_author)),
    ];

    return result;
  }

  @override
  GFetchCommentsByBeaconIdData_comment deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchCommentsByBeaconIdData_commentBuilder();

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
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'beacon_id':
          result.beacon_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFetchCommentsByBeaconIdData_comment_author))!
              as GFetchCommentsByBeaconIdData_comment_author);
          break;
      }
    }

    return result.build();
  }
}

class _$GFetchCommentsByBeaconIdData_comment_authorSerializer
    implements
        StructuredSerializer<GFetchCommentsByBeaconIdData_comment_author> {
  @override
  final Iterable<Type> types = const [
    GFetchCommentsByBeaconIdData_comment_author,
    _$GFetchCommentsByBeaconIdData_comment_author
  ];
  @override
  final String wireName = 'GFetchCommentsByBeaconIdData_comment_author';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFetchCommentsByBeaconIdData_comment_author object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'has_picture',
      serializers.serialize(object.has_picture,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GFetchCommentsByBeaconIdData_comment_author deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFetchCommentsByBeaconIdData_comment_authorBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
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

class _$GFetchCommentsByBeaconIdData extends GFetchCommentsByBeaconIdData {
  @override
  final String G__typename;
  @override
  final BuiltList<GFetchCommentsByBeaconIdData_comment> comment;

  factory _$GFetchCommentsByBeaconIdData(
          [void Function(GFetchCommentsByBeaconIdDataBuilder)? updates]) =>
      (new GFetchCommentsByBeaconIdDataBuilder()..update(updates))._build();

  _$GFetchCommentsByBeaconIdData._(
      {required this.G__typename, required this.comment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFetchCommentsByBeaconIdData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        comment, r'GFetchCommentsByBeaconIdData', 'comment');
  }

  @override
  GFetchCommentsByBeaconIdData rebuild(
          void Function(GFetchCommentsByBeaconIdDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchCommentsByBeaconIdDataBuilder toBuilder() =>
      new GFetchCommentsByBeaconIdDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchCommentsByBeaconIdData &&
        G__typename == other.G__typename &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFetchCommentsByBeaconIdData')
          ..add('G__typename', G__typename)
          ..add('comment', comment))
        .toString();
  }
}

class GFetchCommentsByBeaconIdDataBuilder
    implements
        Builder<GFetchCommentsByBeaconIdData,
            GFetchCommentsByBeaconIdDataBuilder> {
  _$GFetchCommentsByBeaconIdData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GFetchCommentsByBeaconIdData_comment>? _comment;
  ListBuilder<GFetchCommentsByBeaconIdData_comment> get comment =>
      _$this._comment ??=
          new ListBuilder<GFetchCommentsByBeaconIdData_comment>();
  set comment(ListBuilder<GFetchCommentsByBeaconIdData_comment>? comment) =>
      _$this._comment = comment;

  GFetchCommentsByBeaconIdDataBuilder() {
    GFetchCommentsByBeaconIdData._initializeBuilder(this);
  }

  GFetchCommentsByBeaconIdDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _comment = $v.comment.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchCommentsByBeaconIdData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchCommentsByBeaconIdData;
  }

  @override
  void update(void Function(GFetchCommentsByBeaconIdDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchCommentsByBeaconIdData build() => _build();

  _$GFetchCommentsByBeaconIdData _build() {
    _$GFetchCommentsByBeaconIdData _$result;
    try {
      _$result = _$v ??
          new _$GFetchCommentsByBeaconIdData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFetchCommentsByBeaconIdData', 'G__typename'),
              comment: comment.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comment';
        comment.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFetchCommentsByBeaconIdData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFetchCommentsByBeaconIdData_comment
    extends GFetchCommentsByBeaconIdData_comment {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String user_id;
  @override
  final String beacon_id;
  @override
  final DateTime created_at;
  @override
  final String content;
  @override
  final GFetchCommentsByBeaconIdData_comment_author author;

  factory _$GFetchCommentsByBeaconIdData_comment(
          [void Function(GFetchCommentsByBeaconIdData_commentBuilder)?
              updates]) =>
      (new GFetchCommentsByBeaconIdData_commentBuilder()..update(updates))
          ._build();

  _$GFetchCommentsByBeaconIdData_comment._(
      {required this.G__typename,
      required this.id,
      required this.user_id,
      required this.beacon_id,
      required this.created_at,
      required this.content,
      required this.author})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFetchCommentsByBeaconIdData_comment', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFetchCommentsByBeaconIdData_comment', 'id');
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'GFetchCommentsByBeaconIdData_comment', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        beacon_id, r'GFetchCommentsByBeaconIdData_comment', 'beacon_id');
    BuiltValueNullFieldError.checkNotNull(
        created_at, r'GFetchCommentsByBeaconIdData_comment', 'created_at');
    BuiltValueNullFieldError.checkNotNull(
        content, r'GFetchCommentsByBeaconIdData_comment', 'content');
    BuiltValueNullFieldError.checkNotNull(
        author, r'GFetchCommentsByBeaconIdData_comment', 'author');
  }

  @override
  GFetchCommentsByBeaconIdData_comment rebuild(
          void Function(GFetchCommentsByBeaconIdData_commentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchCommentsByBeaconIdData_commentBuilder toBuilder() =>
      new GFetchCommentsByBeaconIdData_commentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchCommentsByBeaconIdData_comment &&
        G__typename == other.G__typename &&
        id == other.id &&
        user_id == other.user_id &&
        beacon_id == other.beacon_id &&
        created_at == other.created_at &&
        content == other.content &&
        author == other.author;
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
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFetchCommentsByBeaconIdData_comment')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('user_id', user_id)
          ..add('beacon_id', beacon_id)
          ..add('created_at', created_at)
          ..add('content', content)
          ..add('author', author))
        .toString();
  }
}

class GFetchCommentsByBeaconIdData_commentBuilder
    implements
        Builder<GFetchCommentsByBeaconIdData_comment,
            GFetchCommentsByBeaconIdData_commentBuilder> {
  _$GFetchCommentsByBeaconIdData_comment? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _beacon_id;
  String? get beacon_id => _$this._beacon_id;
  set beacon_id(String? beacon_id) => _$this._beacon_id = beacon_id;

  DateTime? _created_at;
  DateTime? get created_at => _$this._created_at;
  set created_at(DateTime? created_at) => _$this._created_at = created_at;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  GFetchCommentsByBeaconIdData_comment_authorBuilder? _author;
  GFetchCommentsByBeaconIdData_comment_authorBuilder get author =>
      _$this._author ??=
          new GFetchCommentsByBeaconIdData_comment_authorBuilder();
  set author(GFetchCommentsByBeaconIdData_comment_authorBuilder? author) =>
      _$this._author = author;

  GFetchCommentsByBeaconIdData_commentBuilder() {
    GFetchCommentsByBeaconIdData_comment._initializeBuilder(this);
  }

  GFetchCommentsByBeaconIdData_commentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _user_id = $v.user_id;
      _beacon_id = $v.beacon_id;
      _created_at = $v.created_at;
      _content = $v.content;
      _author = $v.author.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchCommentsByBeaconIdData_comment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchCommentsByBeaconIdData_comment;
  }

  @override
  void update(
      void Function(GFetchCommentsByBeaconIdData_commentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchCommentsByBeaconIdData_comment build() => _build();

  _$GFetchCommentsByBeaconIdData_comment _build() {
    _$GFetchCommentsByBeaconIdData_comment _$result;
    try {
      _$result = _$v ??
          new _$GFetchCommentsByBeaconIdData_comment._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GFetchCommentsByBeaconIdData_comment', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFetchCommentsByBeaconIdData_comment', 'id'),
              user_id: BuiltValueNullFieldError.checkNotNull(
                  user_id, r'GFetchCommentsByBeaconIdData_comment', 'user_id'),
              beacon_id: BuiltValueNullFieldError.checkNotNull(beacon_id,
                  r'GFetchCommentsByBeaconIdData_comment', 'beacon_id'),
              created_at: BuiltValueNullFieldError.checkNotNull(created_at,
                  r'GFetchCommentsByBeaconIdData_comment', 'created_at'),
              content: BuiltValueNullFieldError.checkNotNull(
                  content, r'GFetchCommentsByBeaconIdData_comment', 'content'),
              author: author.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFetchCommentsByBeaconIdData_comment',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFetchCommentsByBeaconIdData_comment_author
    extends GFetchCommentsByBeaconIdData_comment_author {
  @override
  final String G__typename;
  @override
  final String title;
  @override
  final bool has_picture;

  factory _$GFetchCommentsByBeaconIdData_comment_author(
          [void Function(GFetchCommentsByBeaconIdData_comment_authorBuilder)?
              updates]) =>
      (new GFetchCommentsByBeaconIdData_comment_authorBuilder()
            ..update(updates))
          ._build();

  _$GFetchCommentsByBeaconIdData_comment_author._(
      {required this.G__typename,
      required this.title,
      required this.has_picture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFetchCommentsByBeaconIdData_comment_author', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFetchCommentsByBeaconIdData_comment_author', 'title');
    BuiltValueNullFieldError.checkNotNull(has_picture,
        r'GFetchCommentsByBeaconIdData_comment_author', 'has_picture');
  }

  @override
  GFetchCommentsByBeaconIdData_comment_author rebuild(
          void Function(GFetchCommentsByBeaconIdData_comment_authorBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchCommentsByBeaconIdData_comment_authorBuilder toBuilder() =>
      new GFetchCommentsByBeaconIdData_comment_authorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchCommentsByBeaconIdData_comment_author &&
        G__typename == other.G__typename &&
        title == other.title &&
        has_picture == other.has_picture;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, has_picture.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFetchCommentsByBeaconIdData_comment_author')
          ..add('G__typename', G__typename)
          ..add('title', title)
          ..add('has_picture', has_picture))
        .toString();
  }
}

class GFetchCommentsByBeaconIdData_comment_authorBuilder
    implements
        Builder<GFetchCommentsByBeaconIdData_comment_author,
            GFetchCommentsByBeaconIdData_comment_authorBuilder> {
  _$GFetchCommentsByBeaconIdData_comment_author? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  bool? _has_picture;
  bool? get has_picture => _$this._has_picture;
  set has_picture(bool? has_picture) => _$this._has_picture = has_picture;

  GFetchCommentsByBeaconIdData_comment_authorBuilder() {
    GFetchCommentsByBeaconIdData_comment_author._initializeBuilder(this);
  }

  GFetchCommentsByBeaconIdData_comment_authorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _title = $v.title;
      _has_picture = $v.has_picture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFetchCommentsByBeaconIdData_comment_author other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchCommentsByBeaconIdData_comment_author;
  }

  @override
  void update(
      void Function(GFetchCommentsByBeaconIdData_comment_authorBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFetchCommentsByBeaconIdData_comment_author build() => _build();

  _$GFetchCommentsByBeaconIdData_comment_author _build() {
    final _$result = _$v ??
        new _$GFetchCommentsByBeaconIdData_comment_author._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFetchCommentsByBeaconIdData_comment_author', 'G__typename'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GFetchCommentsByBeaconIdData_comment_author', 'title'),
            has_picture: BuiltValueNullFieldError.checkNotNull(has_picture,
                r'GFetchCommentsByBeaconIdData_comment_author', 'has_picture'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
