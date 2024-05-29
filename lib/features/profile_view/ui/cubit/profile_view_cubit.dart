import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/profile/domain/entity/user.dart';

import '../../data/profile_view_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_view_state.dart';

class ProfileViewCubit extends Cubit<ProfileViewState> {
  ProfileViewCubit({
    required this.id,
    bool fetchOnStart = true,
    ProfileViewRepository? profileViewRepository,
  })  : _profileViewRepository =
            profileViewRepository ?? ProfileViewRepository(),
        super(ProfileViewState.empty) {
    if (fetchOnStart) fetch();
  }

  final String id;

  final ProfileViewRepository _profileViewRepository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      final profile = await _profileViewRepository.fetchById(id);
      emit(state.copyWith(
        user: profile.user,
        beacons: profile.beacons,
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
      emit(state.copyWith(
        user: state.user.copyWith(
            myVote: await _profileViewRepository.voteById(
          userId: userId,
          amount: amount,
        )),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
