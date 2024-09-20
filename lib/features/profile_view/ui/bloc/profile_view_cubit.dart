import 'package:get_it/get_it.dart';

import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/profile_view_repository.dart';
import 'profile_view_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'profile_view_state.dart';

class ProfileViewCubit extends Cubit<ProfileViewState> {
  ProfileViewCubit({
    required this.id,
    ProfileViewRepository? repository,
  })  : _repository = repository ?? GetIt.I<ProfileViewRepository>(),
        super(const ProfileViewState()) {
    fetch();
  }

  final String id;

  final ProfileViewRepository _repository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      final (:profile, :beacons) = await _repository.fetchByUserId(id);
      emit(state.copyWith(
        profile: profile,
        beacons: beacons.toList(),
        status: FetchStatus.isSuccess,
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
