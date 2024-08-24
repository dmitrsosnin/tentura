import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/comment.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/beacon_view_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_view_state.dart';

class BeaconViewCubit extends Cubit<BeaconViewState> {
  BeaconViewCubit(
    this.beaconViewRepository, {
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

  final BeaconViewRepository beaconViewRepository;

  Future<void> fetch({bool fetchComments = true}) async {
    if (state.beacon.id.isEmpty && state.hasNoFocusedComment) return;
    emit(state.setLoading());
    try {
      if (state.hasFocusedComment) {
        // Show Beacon with one Comment
        final (beacon, comment) =
            await beaconViewRepository.fetchCommentById(state.focusCommentId);
        emit(state.copyWith(
          beacon: beacon,
          comments: [comment],
          status: FetchStatus.isSuccess,
        ));
      } else {
        // show Beacon with all Comments
        if (state.beacon.title.isEmpty) {
          emit(state.copyWith(
            beacon: await beaconViewRepository.fetchBeaconById(state.beacon.id),
            status: FetchStatus.isSuccess,
          ));
        }
        if (fetchComments) {
          emit(state.setLoading());
          emit(state.copyWith(
            status: FetchStatus.isSuccess,
            comments: List.of(
              await beaconViewRepository
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
    emit(state.copyWith(
      focusCommentId: '',
    ));
    return fetch();
  }

  Future<void> addComment(String text) async {
    emit(state.setLoading());
    try {
      final comment = await beaconViewRepository.addComment(
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
      beaconViewRepository.voteForComment(
        commentId: commentId,
        amount: amount,
      );
}
