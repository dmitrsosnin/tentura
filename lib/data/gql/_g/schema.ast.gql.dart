// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const schema = _i1.SchemaDefinitionNode(
  directives: [],
  operationTypes: [
    _i1.OperationTypeDefinitionNode(
      operation: _i1.OperationType.query,
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'query_root'),
        isNonNull: false,
      ),
    ),
    _i1.OperationTypeDefinitionNode(
      operation: _i1.OperationType.mutation,
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'mutation_root'),
        isNonNull: false,
      ),
    ),
    _i1.OperationTypeDefinitionNode(
      operation: _i1.OperationType.subscription,
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'subscription_root'),
        isNonNull: false,
      ),
    ),
  ],
);
const cached = _i1.DirectiveDefinitionNode(
  name: _i1.NameNode(value: 'cached'),
  args: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ttl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: _i1.IntValueNode(value: '60'),
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'refresh'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: _i1.BooleanValueNode(value: false),
    ),
  ],
  locations: [_i1.DirectiveLocation.query],
  repeatable: false,
);
const Address = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Address'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'ISO31662lvl15'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'ISO31662lvl4'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'city'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'city_district'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'commercial'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'country'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'country_code'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'region'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'state'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'suburb'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const beacon = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'author'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'enabled'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'place'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'timerange'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
  ],
);
const beacon_aggregate = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_aggregate'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'aggregate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_aggregate_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'nodes'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const beacon_aggregate_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_aggregate_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'avg'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_avg_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'count'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'columns'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'max'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_max_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'min'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_min_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_stddev_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev_pop'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_stddev_pop_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev_samp'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_stddev_samp_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'sum'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_sum_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'var_pop'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_var_pop_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'var_samp'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_var_samp_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'variance'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_variance_fields'),
        isNonNull: false,
      ),
    ),
  ],
);
const beacon_avg_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_avg_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const beacon_bool_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_bool_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'beacon_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_not'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'beacon_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'author'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_aggregate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_aggregate_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'enabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'place'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'timerange'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const beacon_constraint = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_constraint'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_pkey'),
      directives: [],
    )
  ],
);
const beacon_inc_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_inc_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    )
  ],
);
const beacon_insert_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_insert_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'author'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_obj_rel_insert_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_arr_rel_insert_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'enabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'place'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'timerange'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const beacon_max_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_max_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const beacon_min_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_min_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const beacon_mutation_response = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_mutation_response'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'affected_rows'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'returning'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const beacon_on_conflict = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_on_conflict'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'constraint'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_constraint'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'update_columns'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'beacon_update_column'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: _i1.ListValueNode(values: []),
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const beacon_order_by = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_order_by'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'author'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_aggregate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_aggregate_order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'enabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'place'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'timerange'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const beacon_pk_columns_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_pk_columns_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    )
  ],
);
const beacon_select_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_select_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'enabled'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'place'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'timerange'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
    ),
  ],
);
const beacon_set_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_set_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'enabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'place'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'timerange'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const beacon_stddev_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_stddev_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const beacon_stddev_pop_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_stddev_pop_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const beacon_stddev_samp_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_stddev_samp_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const beacon_stream_cursor_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_stream_cursor_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'initial_value'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_stream_cursor_value_input'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ordering'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'cursor_ordering'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const beacon_stream_cursor_value_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_stream_cursor_value_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'enabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'place'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'timerange'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const beacon_sum_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_sum_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    )
  ],
);
const beacon_update_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_update_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'enabled'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'place'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'timerange'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
    ),
  ],
);
const beacon_updates = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_updates'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_inc'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_inc_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_set'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_set_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_bool_exp'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const beacon_var_pop_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_var_pop_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const beacon_var_samp_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_var_samp_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const beacon_variance_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'beacon_variance_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comments_count'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const Boolean_comparison_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Boolean_comparison_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_is_null'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'author'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
  ],
);
const comment_aggregate = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_aggregate'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'aggregate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_aggregate_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'nodes'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const comment_aggregate_bool_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_aggregate_bool_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'count'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_aggregate_bool_exp_count'),
        isNonNull: false,
      ),
      defaultValue: null,
    )
  ],
);
const comment_aggregate_bool_exp_count = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_aggregate_bool_exp_count'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'arguments'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment_select_column'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'distinct'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'filter'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'predicate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int_comparison_exp'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_aggregate_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_aggregate_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'count'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'columns'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'max'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_max_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'min'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_min_fields'),
        isNonNull: false,
      ),
    ),
  ],
);
const comment_aggregate_order_by = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_aggregate_order_by'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'count'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'max'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_max_order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'min'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_min_order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_arr_rel_insert_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_arr_rel_insert_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment_insert_input'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'on_conflict'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_on_conflict'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_bool_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_bool_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_not'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'author'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_constraint = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_constraint'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'comment_pkey'),
      directives: [],
    )
  ],
);
const comment_insert_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_insert_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'author'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_obj_rel_insert_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_max_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_max_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const comment_max_order_by = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_max_order_by'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_min_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_min_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const comment_min_order_by = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_min_order_by'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_mutation_response = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_mutation_response'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'affected_rows'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'returning'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const comment_on_conflict = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_on_conflict'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'constraint'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_constraint'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'update_columns'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment_update_column'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: _i1.ListValueNode(values: []),
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_order_by = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_order_by'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'author'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_pk_columns_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_pk_columns_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    )
  ],
);
const comment_select_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_select_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
    ),
  ],
);
const comment_set_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_set_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_stream_cursor_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_stream_cursor_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'initial_value'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_stream_cursor_value_input'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ordering'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'cursor_ordering'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_stream_cursor_value_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_stream_cursor_value_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const comment_update_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_update_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'beacon_id'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'content'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'user_id'),
      directives: [],
    ),
  ],
);
const comment_updates = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'comment_updates'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_set'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_set_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_bool_exp'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const cursor_ordering = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'cursor_ordering'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'ASC'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'DESC'),
      directives: [],
    ),
  ],
);
const Features = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Features'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'bbox'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Float'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'geometry'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Geometry'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'properties'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Properties'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'type'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const geography = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'geography'),
  directives: [],
);
const geography_cast_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'geography_cast_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'geometry'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    )
  ],
);
const geography_comparison_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'geography_comparison_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_cast'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography_cast_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'geography'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_is_null'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'geography'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_d_within'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'st_d_within_geography_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_intersects'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const geometry = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'geometry'),
  directives: [],
);
const Geometry = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Geometry'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'coordinates'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Float'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'type'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const geometry_cast_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'geometry_cast_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'geography'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    )
  ],
);
const geometry_comparison_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'geometry_comparison_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_cast'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry_cast_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'geometry'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_is_null'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'geometry'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_3d_d_within'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'st_d_within_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_3d_intersects'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_contains'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_crosses'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_d_within'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'st_d_within_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_equals'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_intersects'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_overlaps'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_touches'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_st_within'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const Int_comparison_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Int_comparison_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Int'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_is_null'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Int'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const mutation_root = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'mutation_root'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_beacon_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_comment_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_user_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_vote_beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_vote_beacon_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'subject'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_vote_comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_vote_comment_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'subject'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_vote_user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'delete_vote_user_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'subject'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'objects'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_insert_input'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_beacon_one'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_insert_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'objects'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_insert_input'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_comment_one'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_insert_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'objects'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_insert_input'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_user_one'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_insert_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_vote_beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'objects'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_insert_input'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_vote_beacon_one'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_insert_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_vote_comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'objects'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_insert_input'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_vote_comment_one'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_insert_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_vote_user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'objects'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_insert_input'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'insert_vote_user_one'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_insert_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'on_conflict'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_on_conflict'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_inc'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_inc_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_beacon_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_inc'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_inc_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'pk_columns'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_pk_columns_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_beacon_many'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'updates'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_updates'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'beacon_mutation_response'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_comment_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'pk_columns'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_pk_columns_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_comment_many'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'updates'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_updates'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment_mutation_response'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_user_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'pk_columns'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_pk_columns_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_user_many'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'updates'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_updates'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'user_mutation_response'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_vote_beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_inc'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_inc_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_vote_beacon_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_inc'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_inc_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'pk_columns'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_pk_columns_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_vote_beacon_many'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'updates'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_updates'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_beacon_mutation_response'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_vote_comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_inc'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_inc_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_vote_comment_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_inc'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_inc_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'pk_columns'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_pk_columns_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_vote_comment_many'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'updates'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_updates'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_comment_mutation_response'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_vote_user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_inc'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_inc_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_bool_exp'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_mutation_response'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_vote_user_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_inc'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_inc_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: '_set'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_set_input'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'pk_columns'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_pk_columns_input'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'update_vote_user_many'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'updates'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_updates'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_user_mutation_response'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
  ],
);
const order_by = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'order_by'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'asc'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'asc_nulls_first'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'asc_nulls_last'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'desc'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'desc_nulls_first'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'desc_nulls_last'),
      directives: [],
    ),
  ],
);
const Properties = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Properties'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'address'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Address'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'addresstype'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'category'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'display_name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'importance'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'osm_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'osm_type'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'place_id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'place_rank'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'type'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const query_root = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'query_root'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comment_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comment_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'getPlaceName'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'lat'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Float'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'long'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Float'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ReverseGeocodingOutput'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_beacon_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_beacon_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'subject'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_comment_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_comment_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'subject'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_user_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_user_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'subject'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user'),
        isNonNull: false,
      ),
    ),
  ],
);
const ReverseGeocodingOutput = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ReverseGeocodingOutput'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'features'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Features'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'licence'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'type'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const st_d_within_geography_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'st_d_within_geography_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'distance'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'from'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geography'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'use_spheroid'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: _i1.BooleanValueNode(value: true),
    ),
  ],
);
const st_d_within_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'st_d_within_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'distance'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'from'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'geometry'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const String_comparison_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'String_comparison_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_ilike'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_iregex'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_is_null'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_like'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nilike'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_niregex'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nlike'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nregex'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nsimilar'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_regex'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_similar'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const subscription_root = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'subscription_root'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'beacon_stream'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'batch_size'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'cursor'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'beacon_stream_cursor_input'),
              isNonNull: false,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comment_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comment_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comment_stream'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'batch_size'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'cursor'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'comment_stream_cursor_input'),
              isNonNull: false,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user_stream'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'batch_size'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'cursor'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_stream_cursor_input'),
              isNonNull: false,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_beacon'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_beacon_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_beacon_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'subject'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_beacon_stream'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'batch_size'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'cursor'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_stream_cursor_input'),
              isNonNull: false,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_comment'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_comment_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_comment_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'subject'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_comment_stream'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'batch_size'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'cursor'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_stream_cursor_input'),
              isNonNull: false,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_comment_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_user_aggregate'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct_on'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'limit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'offset'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order_by'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_order_by'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_aggregate'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_user_by_pk'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'object'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'subject'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'vote_user_stream'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'batch_size'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'cursor'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_stream_cursor_input'),
              isNonNull: false,
            ),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'vote_user_bool_exp'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const timestamptz = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'timestamptz'),
  directives: [],
);
const timestamptz_comparison_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'timestamptz'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_is_null'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'timestamptz'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const tstzrange = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'tstzrange'),
  directives: [],
);
const tstzrange_comparison_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'tstzrange_comparison_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'tstzrange'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_is_null'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'tstzrange'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'tstzrange'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const user = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
  ],
);
const user_aggregate = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_aggregate'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'aggregate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_aggregate_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'nodes'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const user_aggregate_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_aggregate_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'count'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'columns'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'max'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_max_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'min'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_min_fields'),
        isNonNull: false,
      ),
    ),
  ],
);
const user_bool_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_bool_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'user_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_not'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'user_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const user_constraint = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_constraint'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'user_pkey'),
      directives: [],
    )
  ],
);
const user_insert_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_insert_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const user_max_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_max_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
  ],
);
const user_min_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_min_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
  ],
);
const user_mutation_response = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_mutation_response'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'affected_rows'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'returning'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const user_obj_rel_insert_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_obj_rel_insert_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_insert_input'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'on_conflict'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_on_conflict'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const user_on_conflict = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_on_conflict'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'constraint'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_constraint'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'update_columns'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'user_update_column'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: _i1.ListValueNode(values: []),
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const user_order_by = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_order_by'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const user_pk_columns_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_pk_columns_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    )
  ],
);
const user_select_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_select_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
  ],
);
const user_set_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_set_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const user_stream_cursor_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_stream_cursor_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'initial_value'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_stream_cursor_value_input'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ordering'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'cursor_ordering'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const user_stream_cursor_value_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_stream_cursor_value_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const user_update_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_update_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'has_picture'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'title'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
  ],
);
const user_updates = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'user_updates'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_set'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_set_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'user_bool_exp'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
  ],
);
const vote_beacon_aggregate = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_aggregate'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'aggregate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_aggregate_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'nodes'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const vote_beacon_aggregate_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_aggregate_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'avg'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_avg_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'count'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'columns'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_beacon_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'max'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_max_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'min'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_min_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_stddev_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev_pop'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_stddev_pop_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev_samp'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_stddev_samp_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'sum'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_sum_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'var_pop'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_var_pop_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'var_samp'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_var_samp_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'variance'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_variance_fields'),
        isNonNull: false,
      ),
    ),
  ],
);
const vote_beacon_avg_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_avg_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_beacon_bool_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_not'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon_constraint = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_constraint'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'vote_beacon_pkey'),
      directives: [],
    )
  ],
);
const vote_beacon_inc_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_inc_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    )
  ],
);
const vote_beacon_insert_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_insert_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon_max_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_max_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
  ],
);
const vote_beacon_min_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_min_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
  ],
);
const vote_beacon_mutation_response = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_mutation_response'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'affected_rows'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'returning'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_beacon'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const vote_beacon_on_conflict = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_on_conflict'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'constraint'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_constraint'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'update_columns'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_beacon_update_column'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: _i1.ListValueNode(values: []),
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon_order_by = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_order_by'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon_pk_columns_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_pk_columns_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon_select_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_select_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
  ],
);
const vote_beacon_set_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_set_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon_stddev_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_stddev_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_beacon_stddev_pop_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_stddev_pop_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_beacon_stddev_samp_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_stddev_samp_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_beacon_stream_cursor_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_stream_cursor_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'initial_value'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_stream_cursor_value_input'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ordering'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'cursor_ordering'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon_stream_cursor_value_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_stream_cursor_value_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon_sum_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_sum_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_beacon_update_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_update_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
  ],
);
const vote_beacon_updates = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_updates'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_inc'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_inc_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_set'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_set_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_beacon_bool_exp'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_beacon_var_pop_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_var_pop_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_beacon_var_samp_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_var_samp_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_beacon_variance_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_beacon_variance_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_comment = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
  ],
);
const vote_comment_aggregate = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_aggregate'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'aggregate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_aggregate_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'nodes'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const vote_comment_aggregate_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_aggregate_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'avg'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_avg_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'count'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'columns'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_comment_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'max'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_max_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'min'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_min_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_stddev_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev_pop'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_stddev_pop_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev_samp'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_stddev_samp_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'sum'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_sum_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'var_pop'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_var_pop_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'var_samp'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_var_samp_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'variance'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_variance_fields'),
        isNonNull: false,
      ),
    ),
  ],
);
const vote_comment_avg_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_avg_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_comment_bool_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_bool_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_comment_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_not'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_comment_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_comment_constraint = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_constraint'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'vote_comment_pkey'),
      directives: [],
    )
  ],
);
const vote_comment_inc_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_inc_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    )
  ],
);
const vote_comment_insert_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_insert_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_comment_max_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_max_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
  ],
);
const vote_comment_min_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_min_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
  ],
);
const vote_comment_mutation_response = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_mutation_response'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'affected_rows'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'returning'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_comment'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const vote_comment_on_conflict = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_on_conflict'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'constraint'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_constraint'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'update_columns'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_comment_update_column'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: _i1.ListValueNode(values: []),
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_comment_order_by = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_order_by'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_comment_pk_columns_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_pk_columns_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_comment_select_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_select_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
  ],
);
const vote_comment_set_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_set_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_comment_stddev_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_stddev_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_comment_stddev_pop_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_stddev_pop_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_comment_stddev_samp_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_stddev_samp_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_comment_stream_cursor_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_stream_cursor_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'initial_value'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_stream_cursor_value_input'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ordering'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'cursor_ordering'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_comment_stream_cursor_value_input =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_stream_cursor_value_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_comment_sum_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_sum_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_comment_update_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_update_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
  ],
);
const vote_comment_updates = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_updates'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_inc'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_inc_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_set'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_set_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_comment_bool_exp'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_comment_var_pop_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_var_pop_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_comment_var_samp_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_var_samp_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_comment_variance_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_comment_variance_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_user = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: true,
      ),
    ),
  ],
);
const vote_user_aggregate = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_aggregate'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'aggregate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_aggregate_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'nodes'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const vote_user_aggregate_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_aggregate_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'avg'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_avg_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'count'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'columns'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'vote_user_select_column'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'distinct'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'max'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_max_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'min'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_min_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_stddev_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev_pop'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_stddev_pop_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stddev_samp'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_stddev_samp_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'sum'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_sum_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'var_pop'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_var_pop_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'var_samp'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_var_samp_fields'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'variance'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_variance_fields'),
        isNonNull: false,
      ),
    ),
  ],
);
const vote_user_avg_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_avg_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_user_bool_exp = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_bool_exp'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_user_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_not'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_user_bool_exp'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz_comparison_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_user_constraint = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_constraint'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'vote_user_pkey'),
      directives: [],
    )
  ],
);
const vote_user_inc_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_inc_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    )
  ],
);
const vote_user_insert_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_insert_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_user_max_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_max_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
  ],
);
const vote_user_min_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_min_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
    ),
  ],
);
const vote_user_mutation_response = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_mutation_response'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'affected_rows'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'returning'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_user'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const vote_user_on_conflict = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_on_conflict'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'constraint'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_constraint'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'update_columns'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'vote_user_update_column'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: _i1.ListValueNode(values: []),
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_bool_exp'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_user_order_by = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_order_by'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'order_by'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_user_pk_columns_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_pk_columns_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_user_select_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_select_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
  ],
);
const vote_user_set_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_set_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_user_stddev_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_stddev_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_user_stddev_pop_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_stddev_pop_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_user_stddev_samp_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_stddev_samp_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_user_stream_cursor_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_stream_cursor_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'initial_value'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_stream_cursor_value_input'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ordering'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'cursor_ordering'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_user_stream_cursor_value_input = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_stream_cursor_value_input'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'timestamptz'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_user_sum_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_sum_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_user_update_column = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_update_column'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'created_at'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'object'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'subject'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'updated_at'),
      directives: [],
    ),
  ],
);
const vote_user_updates = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_updates'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_inc'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_inc_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: '_set'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_set_input'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'where'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'vote_user_bool_exp'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const vote_user_var_pop_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_var_pop_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_user_var_samp_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_var_samp_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const vote_user_variance_fields = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'vote_user_variance_fields'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    )
  ],
);
const document = _i1.DocumentNode(definitions: [
  schema,
  cached,
  Address,
  beacon,
  beacon_aggregate,
  beacon_aggregate_fields,
  beacon_avg_fields,
  beacon_bool_exp,
  beacon_constraint,
  beacon_inc_input,
  beacon_insert_input,
  beacon_max_fields,
  beacon_min_fields,
  beacon_mutation_response,
  beacon_on_conflict,
  beacon_order_by,
  beacon_pk_columns_input,
  beacon_select_column,
  beacon_set_input,
  beacon_stddev_fields,
  beacon_stddev_pop_fields,
  beacon_stddev_samp_fields,
  beacon_stream_cursor_input,
  beacon_stream_cursor_value_input,
  beacon_sum_fields,
  beacon_update_column,
  beacon_updates,
  beacon_var_pop_fields,
  beacon_var_samp_fields,
  beacon_variance_fields,
  Boolean_comparison_exp,
  comment,
  comment_aggregate,
  comment_aggregate_bool_exp,
  comment_aggregate_bool_exp_count,
  comment_aggregate_fields,
  comment_aggregate_order_by,
  comment_arr_rel_insert_input,
  comment_bool_exp,
  comment_constraint,
  comment_insert_input,
  comment_max_fields,
  comment_max_order_by,
  comment_min_fields,
  comment_min_order_by,
  comment_mutation_response,
  comment_on_conflict,
  comment_order_by,
  comment_pk_columns_input,
  comment_select_column,
  comment_set_input,
  comment_stream_cursor_input,
  comment_stream_cursor_value_input,
  comment_update_column,
  comment_updates,
  cursor_ordering,
  Features,
  geography,
  geography_cast_exp,
  geography_comparison_exp,
  geometry,
  Geometry,
  geometry_cast_exp,
  geometry_comparison_exp,
  Int_comparison_exp,
  mutation_root,
  order_by,
  Properties,
  query_root,
  ReverseGeocodingOutput,
  st_d_within_geography_input,
  st_d_within_input,
  String_comparison_exp,
  subscription_root,
  timestamptz,
  timestamptz_comparison_exp,
  tstzrange,
  tstzrange_comparison_exp,
  user,
  user_aggregate,
  user_aggregate_fields,
  user_bool_exp,
  user_constraint,
  user_insert_input,
  user_max_fields,
  user_min_fields,
  user_mutation_response,
  user_obj_rel_insert_input,
  user_on_conflict,
  user_order_by,
  user_pk_columns_input,
  user_select_column,
  user_set_input,
  user_stream_cursor_input,
  user_stream_cursor_value_input,
  user_update_column,
  user_updates,
  vote_beacon,
  vote_beacon_aggregate,
  vote_beacon_aggregate_fields,
  vote_beacon_avg_fields,
  vote_beacon_bool_exp,
  vote_beacon_constraint,
  vote_beacon_inc_input,
  vote_beacon_insert_input,
  vote_beacon_max_fields,
  vote_beacon_min_fields,
  vote_beacon_mutation_response,
  vote_beacon_on_conflict,
  vote_beacon_order_by,
  vote_beacon_pk_columns_input,
  vote_beacon_select_column,
  vote_beacon_set_input,
  vote_beacon_stddev_fields,
  vote_beacon_stddev_pop_fields,
  vote_beacon_stddev_samp_fields,
  vote_beacon_stream_cursor_input,
  vote_beacon_stream_cursor_value_input,
  vote_beacon_sum_fields,
  vote_beacon_update_column,
  vote_beacon_updates,
  vote_beacon_var_pop_fields,
  vote_beacon_var_samp_fields,
  vote_beacon_variance_fields,
  vote_comment,
  vote_comment_aggregate,
  vote_comment_aggregate_fields,
  vote_comment_avg_fields,
  vote_comment_bool_exp,
  vote_comment_constraint,
  vote_comment_inc_input,
  vote_comment_insert_input,
  vote_comment_max_fields,
  vote_comment_min_fields,
  vote_comment_mutation_response,
  vote_comment_on_conflict,
  vote_comment_order_by,
  vote_comment_pk_columns_input,
  vote_comment_select_column,
  vote_comment_set_input,
  vote_comment_stddev_fields,
  vote_comment_stddev_pop_fields,
  vote_comment_stddev_samp_fields,
  vote_comment_stream_cursor_input,
  vote_comment_stream_cursor_value_input,
  vote_comment_sum_fields,
  vote_comment_update_column,
  vote_comment_updates,
  vote_comment_var_pop_fields,
  vote_comment_var_samp_fields,
  vote_comment_variance_fields,
  vote_user,
  vote_user_aggregate,
  vote_user_aggregate_fields,
  vote_user_avg_fields,
  vote_user_bool_exp,
  vote_user_constraint,
  vote_user_inc_input,
  vote_user_insert_input,
  vote_user_max_fields,
  vote_user_min_fields,
  vote_user_mutation_response,
  vote_user_on_conflict,
  vote_user_order_by,
  vote_user_pk_columns_input,
  vote_user_select_column,
  vote_user_set_input,
  vote_user_stddev_fields,
  vote_user_stddev_pop_fields,
  vote_user_stddev_samp_fields,
  vote_user_stream_cursor_input,
  vote_user_stream_cursor_value_input,
  vote_user_sum_fields,
  vote_user_update_column,
  vote_user_updates,
  vote_user_var_pop_fields,
  vote_user_var_samp_fields,
  vote_user_variance_fields,
]);
