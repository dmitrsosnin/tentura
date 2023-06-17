import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/user/entity/user.dart';
import 'package:gravity/auth/data/auth_repository.dart';
import 'package:gravity/user/data/user_repository.dart';
import 'package:gravity/_shared/data/image_repository.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(const MyProfileState());

  final _authRepository = GetIt.I<AuthRepository>();
  final _userRepository = GetIt.I<UserRepository>();
  final _imageRepository = GetIt.I<ImageRepository>();

  String newDisplayName = '', newDescription = '', newPhotoUrl = '';

  Future<void> refresh() async {
    if (_authRepository.myId.isEmpty) throw Exception('myId is empty!');
    emit(state.copyWith(isLoading: true));
    try {
      final user = await _userRepository.getUserById(_authRepository.myId) ??
          await _userRepository.createMyProfile();
      final profile = MyProfileState.fromEntity(user).copyWith(
        photoUrl: await _imageRepository.getAvatarURL(user.id),
        isLoading: false,
      );
      newDisplayName = profile.displayName;
      newDescription = profile.description;
      newPhotoUrl = profile.photoUrl;
      emit(profile);
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  void edit() {
    newDisplayName = state.displayName;
    newDescription = state.description;
    newPhotoUrl = state.photoUrl;
    emit(state.copyWith(isEditing: true));
  }

  Future<void> save() async {
    if (state.displayName == newDisplayName &&
        state.description == newDescription &&
        state.photoUrl == newPhotoUrl) {
      emit(state.copyWith(isEditing: false));
      return;
    }
    try {
      emit(MyProfileState.fromEntity(await _userRepository.updateMyProfile(
        id: _authRepository.myId,
        displayName: newDisplayName,
        description: newDescription,
        photoUrl: newPhotoUrl,
      ))
          .copyWith(
        photoUrl: await _imageRepository.getAvatarURL(state.id),
        isEditing: false,
      ));
    } catch (_) {}
  }

  Future<void> signOut() {
    emit(const MyProfileState());
    return _authRepository.signOut();
  }

  Future<void> uploadPhoto(String path) async {
    final origUrl = state.photoUrl;
    emit(state.copyWith(photoUrl: ''));
    try {
      _imageRepository
          .uploadAvatar(userId: _authRepository.myId, imagePath: path)
          .listen(
        (event) async {
          if (event.isFinished) {
            emit(state.copyWith(
              photoUrl: await _imageRepository.getAvatarURL(state.id),
            ));
          }
        },
        onError: (e) {
          if (kDebugMode) print(e);
          emit(state.copyWith(photoUrl: origUrl));
        },
        cancelOnError: true,
      );
    } catch (e) {
      if (kDebugMode) print(e);
      emit(state.copyWith(photoUrl: origUrl));
    }
  }
}
