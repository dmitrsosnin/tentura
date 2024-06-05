import 'package:ferry/ferry.dart';

import 'exception.dart';

extension ErrorHandler<TData, TVars> on OperationResponse<TData, TVars> {
  bool get hasNoErrors => !hasErrors;

  OperationResponse<TData, TVars> throwIfError({
    bool failOnNull = true,
    String? label,
  }) {
    if (hasErrors) {
      throw GraphQLException(
        error: linkException ?? graphqlErrors,
        label: label,
      );
    }
    if (failOnNull && data == null) {
      throw GraphQLNoDataException(label: label);
    }
    return this;
  }

  TData dataOrThrow({String? label}) => throwIfError(label: label).data!;
}
