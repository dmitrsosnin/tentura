// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GcommentFieldsReq> _$gcommentFieldsReqSerializer =
    new _$GcommentFieldsReqSerializer();

class _$GcommentFieldsReqSerializer
    implements StructuredSerializer<GcommentFieldsReq> {
  @override
  final Iterable<Type> types = const [GcommentFieldsReq, _$GcommentFieldsReq];
  @override
  final String wireName = 'GcommentFieldsReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GcommentFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GcommentFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i5.DocumentNode)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];
    Object? value;
    value = object.fragmentName;
    if (value != null) {
      result
        ..add('fragmentName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GcommentFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcommentFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GcommentFieldsVars))!
              as _i3.GcommentFieldsVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i5.DocumentNode))!
              as _i5.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ]))! as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GcommentFieldsReq extends GcommentFieldsReq {
  @override
  final _i3.GcommentFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GcommentFieldsReq(
          [void Function(GcommentFieldsReqBuilder)? updates]) =>
      (new GcommentFieldsReqBuilder()..update(updates))._build();

  _$GcommentFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GcommentFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GcommentFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GcommentFieldsReq', 'idFields');
  }

  @override
  GcommentFieldsReq rebuild(void Function(GcommentFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcommentFieldsReqBuilder toBuilder() =>
      new GcommentFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcommentFieldsReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, document.hashCode);
    _$hash = $jc(_$hash, fragmentName.hashCode);
    _$hash = $jc(_$hash, idFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GcommentFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GcommentFieldsReqBuilder
    implements Builder<GcommentFieldsReq, GcommentFieldsReqBuilder> {
  _$GcommentFieldsReq? _$v;

  _i3.GcommentFieldsVarsBuilder? _vars;
  _i3.GcommentFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GcommentFieldsVarsBuilder();
  set vars(_i3.GcommentFieldsVarsBuilder? vars) => _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GcommentFieldsReqBuilder() {
    GcommentFieldsReq._initializeBuilder(this);
  }

  GcommentFieldsReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcommentFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcommentFieldsReq;
  }

  @override
  void update(void Function(GcommentFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GcommentFieldsReq build() => _build();

  _$GcommentFieldsReq _build() {
    _$GcommentFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GcommentFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GcommentFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GcommentFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GcommentFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
