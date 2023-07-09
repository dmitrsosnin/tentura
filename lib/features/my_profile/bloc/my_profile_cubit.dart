import 'dart:io';
import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/bloc/state_base.dart';
import 'package:gravity/bloc/bloc_data_status.dart';
import 'package:gravity/data/image_repository.dart';
import 'package:gravity/entity/user.dart';

import 'package:gravity/data/user_repository.dart';
import 'package:gravity/data/auth_repository.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(const MyProfileState()) {
    refresh();
  }

  final _authRepository = GetIt.I<AuthRepository>();
  final _userRepository = GetIt.I<UserRepository>();
  final _imageRepository = GetIt.I<ImageRepository>();

  var _newTitle = '';
  var _newDescription = '';

  void updateTitle(String value) => _newTitle = value;

  void updateDescription(String value) => _newDescription = value;

  Future<void> refresh() async {
    if (_authRepository.myId.isEmpty) throw Exception('myId is empty!');
    emit(state.copyWith(
      status: BlocDataStatus.isLoading,
    ));
    try {
      final user = await _userRepository.getUserById(_authRepository.myId) ??
          await _userRepository.createMyProfile();
      _newTitle = user.title;
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
    _newTitle = state.profile.title;
    _newDescription = state.profile.description;
    emit(state.copyWith(
      isEditing: true,
    ));
  }

  Future<void> save() async {
    // TBD: exit if no changes
    try {
      if (state.newPicturePath.isNotEmpty) {
        await _imageRepository
            .putAvatar(
              userId: state.profile.id,
              image: await File(state.newPicturePath).readAsBytes(),
            )
            .firstWhere((e) => e.isFinished);
      }
      emit(MyProfileState(
        status: BlocDataStatus.hasData,
        profile: await _userRepository.updateMyProfile(
          id: state.profile.id,
          title: _newTitle,
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

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(const MyProfileState());
  }

  Future<void> uploadPhoto() async {
    final newImage = await _imageRepository.pickImage();
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
