import 'package:flutter/material.dart';

import 'package:tentura/data/gql/gql_client.dart';

export 'package:flutter/material.dart';

export 'package:tentura/data/gql/gql_client.dart';

/// Do request and show SnackBar with error message if response hasError and context is provided
Future<OperationResponse<TData, TVars>> doRequest<TData, TVars>({
  required OperationRequest<TData, TVars> request,
  BuildContext? context,
}) async {
  final response = await GetIt.I<Client>()
      .request(request)
      .firstWhere((e) => e.dataSource != DataSource.Optimistic);
  if (response.hasErrors) {
    if (context != null && context.mounted) {
      final colors = Theme.of(context).colorScheme;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          (response.linkException ?? response.graphqlErrors).toString(),
          style: TextStyle(
            backgroundColor: colors.error,
            color: colors.onError,
          ),
        ),
      ));
    }
  }
  return response;
}
