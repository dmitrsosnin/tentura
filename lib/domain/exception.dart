class GraphQLException implements Exception {
  const GraphQLException({
    this.label = 'No label',
    this.error = 'Unknown error on OperationRequest',
  });

  final Object? error;
  final String? label;

  @override
  String toString() => '$label: $error';
}

class GraphQLNoDataException implements Exception {
  const GraphQLNoDataException({
    this.label = 'No label',
  });

  final String? label;

  @override
  String toString() => '$label: OperationResponse has no data';
}
