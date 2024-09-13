import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:tentura/domain/entity/user.dart';

part 'user_rating.freezed.dart';

@freezed
class UserRating with _$UserRating {
  const factory UserRating({
    required double egoScore,
    required double userScore,
    required User user,
  }) = _UserRating;
}
