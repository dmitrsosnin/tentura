import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:tentura/domain/entity/user.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    required String title,
    required String description,
    required bool hasPicture,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);

  factory ProfileModel.fromEntity(User entity) => ProfileModel(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        hasPicture: entity.has_picture,
      );

  const ProfileModel._();

  User get toEntity => User.empty.copyWith(
        id: id,
        title: title,
        description: description,
        hasPicture: hasPicture,
      );
}
