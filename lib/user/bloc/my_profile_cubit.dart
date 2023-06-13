import 'package:get_it/get_it.dart';
import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/user/entity/user.dart';
import 'package:gravity/auth/data/auth_repository.dart';
import 'package:gravity/user/data/user_repository.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(const MyProfileState());

  final _authRepository = GetIt.I<AuthRepository>();
  final _userRepository = GetIt.I<UserRepository>();

  Future<void> refresh() async {
    emit(state.copyWith(id: ''));
    try {
      emit(MyProfileState.fromEntity(
        await _userRepository.getUserById(_authRepository.authInfo.id),
      ));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> signOut() => _authRepository.signOut();
}
