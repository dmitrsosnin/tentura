import 'package:ferry/ferry.dart';
import 'package:fresh_graphql/fresh_graphql.dart';

import 'exception.dart';

extension HasToken on AuthenticationStatus {
  bool get hasToken => this == AuthenticationStatus.authenticated;
}

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
