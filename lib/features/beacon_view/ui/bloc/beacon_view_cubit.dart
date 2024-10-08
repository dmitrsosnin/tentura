import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/beacon_view_repository.dart';
import 'beacon_view_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'beacon_view_state.dart';

class BeaconViewCubit extends Cubit<BeaconViewState> {
  BeaconViewCubit(
    this._beaconViewRepository, {
    required String id,
    bool fetchCommentsOnStart = false,
  }) : super(switch (id) {
          _ when id.startsWith('B') => BeaconViewState(
              beacon: Beacon.empty.copyWith(id: id),
            ),
          _ when id.startsWith('C') => BeaconViewState(
              beacon: Beacon.empty,
              focusCommentId: id,
            ),
          _ => BeaconViewState(
              beacon: Beacon.empty,
              error: 'Wrong id: $id',
              status: FetchStatus.isFailure,
            ),
        }) {
    fetch(fetchComments: fetchCommentsOnStart || state.hasFocusedComment);
  }

  final BeaconViewRepository _beaconViewRepository;

  Future<void> fetch({bool fetchComments = true}) async {
    if (state.beacon.id.isEmpty && state.hasNoFocusedComment) return;
    emit(state.setLoading());
    try {
      if (state.hasFocusedComment) {
        // Show Beacon with one Comment
        final (beacon, comment) =
            await _beaconViewRepository.fetchCommentById(state.focusCommentId);
        emit(state.copyWith(
          beacon: beacon,
          comments: [comment],
          status: FetchStatus.isSuccess,
        ));
      } else {
        // show Beacon with all Comments
        if (state.beacon.title.isEmpty) {
          emit(state.copyWith(
            beacon:
                await _beaconViewRepository.fetchBeaconById(state.beacon.id),
            status: FetchStatus.isSuccess,
          ));
        }
        if (fetchComments) {
          emit(state.setLoading());
          emit(state.copyWith(
            status: FetchStatus.isSuccess,
            comments: List.of(
              await _beaconViewRepository
                  .fetchCommentsByBeaconId(state.beacon.id),
              growable: false,
            ),
          ));
        }
      }
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> showAll() async {
    emit(state.copyWith(focusCommentId: ''));
    return fetch();
  }

  Future<void> addComment(String text) async {
    emit(state.setLoading());
    try {
      final comment = await _beaconViewRepository.addComment(
        beaconId: state.beacon.id,
        text: text,
      );
      emit(state.copyWith(
        status: FetchStatus.isSuccess,
        comments: List.from(state.comments)..add(comment),
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
