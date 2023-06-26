import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/_shared/bloc/state_base.dart';
import 'package:gravity/_shared/bloc/bloc_data_status.dart';

import 'package:gravity/auth/data/auth_repository.dart';
import 'package:gravity/image/use_case/pick_image_case.dart';

import 'package:gravity/user/entity/user.dart';
import 'package:gravity/user/data/user_repository.dart';
import 'package:gravity/user/use_case/avatar_image_case.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState>
    with AvatarImageCase, PickImageCase {
  MyProfileCubit() : super(const MyProfileState()) {
    refresh();
  }

  final _authRepository = GetIt.I<AuthRepository>();
  final _userRepository = GetIt.I<UserRepository>();

  String _newDisplayName = '', _newDescription = '';

  void updateDisplayName(String value) => _newDisplayName = value;

  void updateDescription(String value) => _newDescription = value;

  Future<void> refresh() async {
    if (_authRepository.myId.isEmpty) throw Exception('myId is empty!');
    emit(state.copyWith(
      status: BlocDataStatus.isLoading,
    ));
    try {
      final user = await _userRepository.getUserById(_authRepository.myId) ??
          await _userRepository.createMyProfile();
      _newDisplayName = user.displayName;
      _newDescription = user.description;
      emit(state.copyWith(
        profile: user,
        clearError: true,
        status: BlocDataStatus.hasData,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocDataStatus.hasError,
        error: e,
      ));
    }
  }

  void edit() {
    _newDisplayName = state.profile.displayName;
    _newDescription = state.profile.description;
    emit(state.copyWith(
      isEditing: true,
    ));
  }

  void save() async {
    // TBD: exit if no changes
    try {
      if (state.newPicturePath.isNotEmpty) {
        await setAvatarImageOf(state.profile.id, state.newPicturePath);
      }
      emit(MyProfileState(
        status: BlocDataStatus.hasData,
        profile: await _userRepository.updateMyProfile(
          id: state.profile.id,
          displayName: _newDisplayName,
          description: _newDescription,
          hasPicture:
              state.profile.hasPicture || state.newPicturePath.isNotEmpty,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        newPicturePath: '',
        status: BlocDataStatus.hasError,
        error: e,
      ));
    }
  }

  void signOut() async {
    await _authRepository.signOut();
    emit(const MyProfileState());
  }

  void uploadPhoto() async {
    final newImage = await pickImage();
    if (newImage == null) return;
    emit(state.copyWith(
      newPicturePath: newImage.path,
    ));
  }

  void removePhoto() {
    emit(state.copyWith(
      newPicturePath: '',
      profile: state.profile.copyWith(
        hasPicture: false,
      ),
    ));
  }
}
