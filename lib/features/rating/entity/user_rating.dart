import 'package:equatable/equatable.dart';

import 'package:tentura/domain/entity/user.dart';

class UserRating extends Equatable {
  const UserRating({
    required this.egoScore,
    required this.userScore,
    required this.user,
  });

  final double egoScore;
  final double userScore;
  final User user;

  @override
  List<Object> get props => [
        egoScore,
        userScore,
        user,
      ];
}
