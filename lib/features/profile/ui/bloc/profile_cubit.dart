import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/domain/use_case/pick_image_case.dart';

import '../../domain/use_case/profile_case.dart';
import 'profile_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required String id,
    bool fromCache = true,
    ProfileCase? profileCase,
  })  : _profileCase = profileCase ?? GetIt.I<ProfileCase>(),
        super(ProfileState(user: User.empty.copyWith(id: id))) {
    fetch(fromCache: fromCache);
  }

  final ProfileCase _profileCase;

  Future<void> fetch({bool fromCache = false}) async {
    emit(state.setLoading());
    try {
      emit(ProfileState(
        user: await _profileCase.fetch(
          state.user.id,
          fromCache: fromCache,
        ),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> update(User profile) async {
    if (profile == state.user) return;
    emit(state.setLoading());
    try {
      emit(ProfileState(
        user: await _profileCase.update(profile),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> delete() async {
    emit(state.setLoading());
    try {
      await _profileCase.delete();
      emit(ProfileState(user: state.user));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<({String name, Uint8List bytes})?> pickImage() =>
      _profileCase.pickImage();

  Future<void> putAvatarImage(Uint8List image) async {
    emit(state.setLoading());
    try {
      await _profileCase.putAvatarImage(image);
      emit(ProfileState(user: state.user));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
