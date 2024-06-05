import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/profile_view_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_view_state.dart';

class ProfileViewCubit extends Cubit<ProfileViewState> {
  ProfileViewCubit({
    required this.id,
    required this.profileViewRepository,
    bool fetchOnStart = true,
  }) : super(ProfileViewState.empty) {
    if (fetchOnStart) fetch();
  }

  final String id;

  final ProfileViewRepository profileViewRepository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      final profile = await profileViewRepository.fetchById(id);
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
            myVote: await profileViewRepository.voteById(
          userId: userId,
          amount: amount,
        )),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
