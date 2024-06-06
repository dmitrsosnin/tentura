import 'dart:typed_data';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/domain/use_case/pick_image_case.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/profile_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

//
// If code obfuscation is needed then visit
//   https://github.com/felangel/bloc/issues/3255
//
class ProfileCubit extends Cubit<ProfileState>
    with HydratedMixin<ProfileState> {
  ProfileCubit({
    required ProfileRepository repository,
    PickImageCase pickImageCase = const PickImageCase(),
  })  : id = repository.userId,
        _pickImageCase = pickImageCase,
        _repository = repository,
        super(ProfileState(user: User.empty)) {
    hydrate();
  }

  ProfileCubit.dummy({
    required String userId,
  })  : id = userId,
        _pickImageCase = const PickImageCase(),
        _repository = const ProfileRepositoryDummy(),
        super(ProfileState(user: User.empty)) {
    hydrate();
  }

  @override
  final String id;

  final PickImageCase _pickImageCase;
  final ProfileRepository _repository;

  @override
  ProfileState? fromJson(Map<String, dynamic> json) =>
      json.isEmpty ? null : ProfileState(user: User.fromJson(json));

  @override
  Map<String, dynamic>? toJson(ProfileState state) => state.user.toJson();

  Future<void> fetch() => _repository.fetch();

  Future<void> update({
    required String title,
    required String description,
    required bool hasPicture,
  }) async {
    if (title == state.user.title &&
        description == state.user.description &&
        hasPicture == state.user.has_picture) return;
    emit(ProfileState(
      user: await _repository.update(
        title: title,
        description: description,
        hasPicture: hasPicture,
      ),
    ));
  }

  Future<void> delete() => _repository.delete();

  Future<void> putAvatarImage(Uint8List image) =>
      _repository.putAvatarImage(image);

  Future<({String name, String path})?> pickImage() =>
      _pickImageCase.pickImage();
}
