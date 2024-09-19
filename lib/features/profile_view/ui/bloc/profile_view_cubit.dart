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
      final (:profile, :beacons) = await _repository.fetchById(id);
      emit(state.copyWith(
        profile: profile,
        beacons: beacons,
        status: FetchStatus.isSuccess,
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> voteById({
    required String userId,
    required int amount,
  }) async {
    try {
      final result = await _repository.voteById(userId: userId, amount: amount);
      if (result == null) throw Exception('Can`t add friend [$userId]');
      emit(state.copyWith(
        profile: state.profile.copyWith(myVote: result),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
