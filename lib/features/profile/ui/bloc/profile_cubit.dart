import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/domain/use_case/pick_image_case.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/auth/domain/exception.dart';

import '../../domain/use_case/profile_case.dart';
import 'profile_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:get_it/get_it.dart';

export 'profile_state.dart';

@singleton
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required String id,
    bool fromCache = true,
    ProfileCase? profileCase,
  })  : _profileCase = profileCase ?? GetIt.I<ProfileCase>(),
        super(ProfileState(user: User.empty.copyWith(id: id))) {
    fetch(fromCache: fromCache);
  }

  @factoryMethod
  ProfileCubit.current({
    required ProfileCase profileCase,
  })  : _profileCase = profileCase,
        super(ProfileState(
          user: User.empty,
          status: FetchStatus.isLoading,
        )) {
    _authChanges = _profileCase.currentAccountChanges.listen(
      (id) async {
        emit(ProfileState(user: User.empty.copyWith(id: id)));
        await fetch();
      },
      cancelOnError: false,
      onError: (Object? e) =>
          emit(state.setError(e ?? const AuthExceptionUnknown())),
    );
  }

  final ProfileCase _profileCase;

  StreamSubscription<String>? _authChanges;

  @override
  @disposeMethod
  Future<void> close() async {
    await _authChanges?.cancel();
    return super.close();
  }

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
      emit(ProfileState(user: await _profileCase.update(profile)));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> delete() async {
    emit(state.setLoading());
    try {
      await _profileCase.delete(state.user.id);
      emit(ProfileState(user: User.empty));
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
