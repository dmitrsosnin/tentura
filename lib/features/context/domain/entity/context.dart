import 'package:equatable/equatable.dart';

sealed class Context {
  const Context();
}

final class ContextNew extends Context {
  const ContextNew();
}

final class ContextAll extends Context {
  const ContextAll();
}

final class ContextValue extends Context with EquatableMixin {
  const ContextValue(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}
