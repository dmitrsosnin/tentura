import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/profile_repository.dart';
import '../../domain/entity/user.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>
    with HydratedMixin<ProfileState> {
  ProfileCubit({
    required this.id,
    ProfileRepository? profileRepository,
  })  : _profileRepository = profileRepository ?? ProfileRepository(),
        super(ProfileState(user: User.empty(id))) {
    hydrate();
  }

  @override
  final String id;

  final ProfileRepository _profileRepository;

  @override
  ProfileState? fromJson(Map<String, dynamic> json) =>
      json.isEmpty ? null : ProfileState(user: User.fromJson(json));

  @override
  Map<String, dynamic>? toJson(ProfileState state) => state.user.toJson();

  Future<void> fetch() => _profileRepository.fetchById(id);

  Future<void> update({
    required String title,
    required String description,
    required bool hasPicture,
  }) async {
    if (title == state.user.title &&
        description == state.user.description &&
        hasPicture == state.user.has_picture) return;
    emit(ProfileState(
      user: await _profileRepository.update(
        id: id,
        title: title,
        description: description,
        hasPicture: hasPicture,
      ),
    ));
  }
}
