import 'dart:isolate';

sealed class Message {
  const Message();
}

class InitMessage extends Message {
  const InitMessage(this.replyPort);

  final SendPort replyPort;
}

class GetTokenMessage extends Message {
  const GetTokenMessage();
}
