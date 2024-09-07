import 'package:equatable/equatable.dart';

class Account extends Equatable {
  const Account({
    required this.id,
    required this.seed,
  });

  final String id;

  final String seed;

  @override
  List<Object> get props => [
        id,
        seed,
      ];
}
