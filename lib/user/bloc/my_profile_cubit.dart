import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/user/entity/user.dart';
import 'package:gravity/_shared/data/image_service.dart';
import 'package:gravity/auth/data/auth_repository.dart';
import 'package:gravity/user/data/user_repository.dart';
import 'package:gravity/_shared/data/image_repository.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(const MyProfileState()) {
    refresh();
  }

  final _imageService = const ImageService();
  final _authRepository = GetIt.I<AuthRepository>();
  final _userRepository = GetIt.I<UserRepository>();
  final _imageRepository = GetIt.I<ImageRepository>();

  String _newDisplayName = '', _newDescription = '';

  void updateDisplayName(String value) => _newDisplayName = value;

  void updateDescription(String value) => _newDescription = value;

  Future<void> refresh() async {
    if (_authRepository.myId.isEmpty) throw Exception('myId is empty!');
    emit(state.copyWith(status: MyProfileStatus.loading));
    try {
      final user = await _userRepository.getUserById(_authRepository.myId) ??
          await _userRepository.createMyProfile();
      _newDisplayName = user.displayName;
      _newDescription = user.description;
      emit(state.copyWith(
        profile: user,
        status: MyProfileStatus.initial,
        clearError: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MyProfileStatus.error,
        error: e,
      ));
    }
  }

  void edit() {
    _newDisplayName = state.profile.displayName;
    _newDescription = state.profile.description;
    emit(state.copyWith(status: MyProfileStatus.editing));
  }

  Future<void> save() async {
    try {
      if (state.newPicturePath.isNotEmpty) {
        await _imageRepository
            .putAvatar(
              userId: state.profile.id,
              picturePath: state.newPicturePath,
            )
            .firstWhere((e) => e.isFinished);
        _imageRepository.evictAvatarOf(state.profile.id);
      }
      emit(state.copyWith(
        newPicturePath: '',
        status: MyProfileStatus.initial,
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
        status: MyProfileStatus.error,
        error: e,
      ));
    }
  }

  Future<void> signOut(bool? isSubmited) async {
    if (isSubmited != true) return;
    emit(const MyProfileState());
    return _authRepository.signOut();
  }

  Future<void> uploadPhoto() async {
    final newPicturePath = await _imageService.pickImage();
    if (newPicturePath == null) return;
    emit(state.copyWith(newPicturePath: newPicturePath));
  }

  void removePhoto() {
    emit(state.copyWith(
      newPicturePath: '',
      profile: state.profile.copyWith(hasPicture: false),
    ));
  }

  Future<Uint8List?> getAvatarImageOf(String userId) async {
    try {
      return await _imageRepository
          .getAvatarOf(userId)
          .timeout(const Duration(seconds: 3));
    } on PlatformException catch (_) {
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }
}
