import 'package:tentura_sdk/tentura_sdk.dart';

export 'package:tentura_sdk/tentura_sdk.dart' show DataSource, FetchPolicy;

class RemoteApiService extends TenturaApi {
  RemoteApiService({
    required super.serverName,
    super.jwtExpiresIn,
    super.storagePath,
  });
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
