import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/domain/entity/comment.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';

import '../../data/beacon_view_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_view_state.dart';

class BeaconViewCubit extends Cubit<BeaconViewState> {
  BeaconViewCubit({
    required this.id,
    bool fetchOnStart = true,
    BeaconViewRepository? beaconViewRepository,
  })  : _beaconViewRepository = beaconViewRepository ?? BeaconViewRepository(),
        super(BeaconViewState.empty) {
    if (fetchOnStart) fetch();
  }

  final String id;

  final BeaconViewRepository _beaconViewRepository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      emit(state.copyWith(
        beacon: await _beaconViewRepository.fetchById(id),
      ));
      emit(state.copyWith(
        status: FetchStatus.isSuccess,
        comments: (await _beaconViewRepository.fetchByBeaconId(id)).toList(),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> addComment(String text) async {
    try {
      final comment = await _beaconViewRepository.addComment(
        beaconId: id,
        text: text,
      );
      emit(state.copyWith(
        comments: [
          ...state.comments,
          comment,
        ],
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<int> voteForComment({
    required String commentId,
    required int amount,
  }) =>
      _beaconViewRepository.voteForComment(
        commentId: commentId,
        amount: amount,
      );
}
