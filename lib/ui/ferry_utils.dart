import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'widget/error_center_text.dart';

export 'package:ferry/ferry.dart';
export 'package:get_it/get_it.dart';
export 'package:flutter/material.dart';
export 'package:ferry_flutter/ferry_flutter.dart';

extension HasNo on OperationResponse<Object, Object> {
  bool get hasNoErrors => !hasErrors;

  bool get hasNoData => data == null;
}

/// Returns null if response has data otherwise shows loader or error
Widget? showLoaderOrErrorOr(
  OperationResponse<Object, Object>? response,
  Object? error,
) =>
    response == null || response.hasErrors
        ? ErrorCenterText(response: response, error: error)
        : response.loading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : null;

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
