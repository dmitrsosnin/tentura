// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;
import 'package:gravity/data/gql/beacon/g/_fragments.ast.gql.dart' as _i2;
import 'package:gravity/data/gql/user/g/_fragments.ast.gql.dart' as _i3;

const CreateBeacon = _i1.OperationDefinitionNode(
  type: _i1.OperationType.mutation,
  name: _i1.NameNode(value: 'CreateBeacon'),
  variableDefinitions: [
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'title')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'description')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'place')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'timerange')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'has_picture')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
  ],
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'insert_beacon_one'),
      alias: null,
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'object'),
          value: _i1.ObjectValueNode(fields: [
            _i1.ObjectFieldNode(
              name: _i1.NameNode(value: 'title'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'title')),
            ),
            _i1.ObjectFieldNode(
              name: _i1.NameNode(value: 'description'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'description')),
            ),
            _i1.ObjectFieldNode(
              name: _i1.NameNode(value: 'place'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'place')),
            ),
            _i1.ObjectFieldNode(
              name: _i1.NameNode(value: 'timerange'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'timerange')),
            ),
            _i1.ObjectFieldNode(
              name: _i1.NameNode(value: 'has_picture'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'has_picture')),
            ),
          ]),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'beaconFields'),
          directives: [],
        )
      ]),
    )
  ]),
);
const document = _i1.DocumentNode(definitions: [
  CreateBeacon,
  _i2.beaconFields,
  _i3.userFields,
]);
