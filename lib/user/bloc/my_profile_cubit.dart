import 'package:get_it/get_it.dart';
import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/user/entity/user.dart';
import 'package:gravity/auth/data/auth_repository.dart';
import 'package:gravity/user/data/user_repository.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(const MyProfileState());

  final _authRepository = GetIt.I<AuthRepository>();
  final _userRepository = GetIt.I<UserRepository>();

  String newDisplayName = '', newDescription = '', newPhotoUrl = '';

  Future<void> refresh() async {
    if (_authRepository.myId.isEmpty) throw Exception('myId is empty!');
    emit(state.copyWith(id: ''));
    try {
      final user = await _userRepository.getUserById(_authRepository.myId) ??
          await _userRepository.createMyProfile();
      final profile = MyProfileState.fromEntity(user);
      newDisplayName = profile.displayName;
      newDescription = profile.description;
      newPhotoUrl = profile.photoUrl;
      emit(profile);
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void edit() {
    newDisplayName = state.displayName;
    newDescription = state.description;
    newPhotoUrl = state.photoUrl;
    emit(state.copyWith(isEditing: true));
  }

  Future<void> save() async {
    try {
      emit(MyProfileState.fromEntity(await _userRepository.updateMyProfile(
        id: _authRepository.myId,
        displayName: newDisplayName,
        description: newDescription,
        photoUrl: newPhotoUrl,
      )));
    } catch (_) {}
  }

  Future<void> signOut() {
    emit(state.copyWith(id: ''));
    return _authRepository.signOut();
  }
}
