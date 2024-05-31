import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/data/repository/image_repository.dart';

import '../../data/profile_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>
    with HydratedMixin<ProfileState> {
  ProfileCubit({
    required this.id,
    required this.imageRepository,
    required this.profileRepository,
  }) : super(ProfileState(user: User.empty)) {
    hydrate();
  }

  factory ProfileCubit.build({
    required String id,
    required Client gqlClient,
    required ImageRepository imageRepository,
  }) =>
      ProfileCubit(
        id: id,
        imageRepository: imageRepository,
        profileRepository: ProfileRepository(
          gqlClient: gqlClient,
        ),
      );

  @override
  final String id;

  final ProfileRepository profileRepository;

  final ImageRepository imageRepository;

  @override
  ProfileState? fromJson(Map<String, dynamic> json) =>
      json.isEmpty ? null : ProfileState(user: User.fromJson(json));

  @override
  Map<String, dynamic>? toJson(ProfileState state) => state.user.toJson();

  Future<void> fetch() => profileRepository.fetchById(id);

  Future<void> update({
    required String title,
    required String description,
    required bool hasPicture,
  }) async {
    if (title == state.user.title &&
        description == state.user.description &&
        hasPicture == state.user.has_picture) return;
    emit(ProfileState(
      user: await profileRepository.update(
        id: id,
        title: title,
        description: description,
        hasPicture: hasPicture,
      ),
    ));
  }

  Future<void> delete() => profileRepository.deleteById(id);
}
