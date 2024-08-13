import 'dart:isolate';

sealed class Message {}

class InitMessage extends Message {
  InitMessage(this.replyPort);

  final SendPort replyPort;
}

sealed class RequestMessage extends Message {}

sealed class ResponseMessage<T extends Object> extends Message {
  ResponseMessage({this.value, this.error});

  final T? value;
  final Exception? error;

  T get valueOrException => value == null ? throw error ?? Exception() : value!;
}

// GetToken
class GetTokenRequest extends RequestMessage {}

class GetTokenResponse extends ResponseMessage<String> {
  GetTokenResponse({super.value, super.error});
}
