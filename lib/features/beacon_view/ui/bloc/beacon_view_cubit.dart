import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/comment.dart';

import '../../data/beacon_view_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_view_state.dart';

class BeaconViewCubit extends Cubit<BeaconViewState> {
  BeaconViewCubit({
    required this.id,
    required this.beaconViewRepository,
    bool fetchOnStart = true,
  }) : super(BeaconViewState.empty) {
    if (fetchOnStart) fetch();
  }

  factory BeaconViewCubit.build({
    required String id,
    required Client gqlClient,
  }) =>
      BeaconViewCubit(
        id: id,
        beaconViewRepository: BeaconViewRepository(
          gqlClient: gqlClient,
        ),
      );

  final String id;

  final BeaconViewRepository beaconViewRepository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      emit(state.copyWith(
        beacon: await beaconViewRepository.fetchById(id),
      ));
      emit(state.copyWith(
        status: FetchStatus.isSuccess,
        comments: (await beaconViewRepository.fetchByBeaconId(id)).toList(),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> addComment(String text) async {
    try {
      final comment = await beaconViewRepository.addComment(
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
      beaconViewRepository.voteForComment(
        commentId: commentId,
        amount: amount,
      );
}
