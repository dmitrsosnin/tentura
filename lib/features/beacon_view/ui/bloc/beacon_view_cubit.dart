import 'package:get_it/get_it.dart';

import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/beacon/data/beacon_repository.dart';
import 'package:tentura/features/comment/data/comment_repository.dart';
import 'package:tentura/features/profile/domain/entity/profile.dart';

import 'beacon_view_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'beacon_view_state.dart';

class BeaconViewCubit extends Cubit<BeaconViewState> {
  static final _zeroDateTime = DateTime.fromMillisecondsSinceEpoch(0);
  static final _emptyBeacon = Beacon(
    createdAt: _zeroDateTime,
    updatedAt: _zeroDateTime,
  );

  BeaconViewCubit({
    required String id,
    required Profile myProfile,
    BeaconRepository? beaconRepository,
    CommentRepository? commentRepository,
  })  : _beaconRepository = beaconRepository ?? GetIt.I<BeaconRepository>(),
        _commentRepository = commentRepository ?? GetIt.I<CommentRepository>(),
        super(switch (id) {
          _ when id.startsWith('B') => BeaconViewState(
              beacon: _emptyBeacon.copyWith(id: id),
              myProfile: myProfile,
            ),
          _ when id.startsWith('C') => BeaconViewState(
              beacon: _emptyBeacon,
              focusCommentId: id,
              myProfile: myProfile,
            ),
          _ => BeaconViewState(
              beacon: _emptyBeacon,
              error: 'Wrong id: $id',
              status: FetchStatus.isFailure,
            ),
        }) {
    fetch();
  }

  final BeaconRepository _beaconRepository;
  final CommentRepository _commentRepository;

  Future<void> fetch() async {
    if (state.beacon.id.isEmpty && state.hasNoFocusedComment) return;
    emit(state.setLoading());
    try {
      if (state.hasFocusedComment) {
        // Show Beacon with one Comment
        final comment =
            await _commentRepository.fetchCommentById(state.focusCommentId);
        final beacon =
            await _beaconRepository.fetchBeaconById(comment.beaconId);
        emit(state.copyWith(
          beacon: beacon,
          comments: [comment],
          status: FetchStatus.isSuccess,
        ));
      } else {
        // show Beacon with all Comments
        if (state.beacon.title.isEmpty) {
          emit(state.copyWith(
            beacon: await _beaconRepository.fetchBeaconById(state.beacon.id),
            status: FetchStatus.isSuccess,
          ));
        }
        emit(state.setLoading());
        emit(state.copyWith(
          status: FetchStatus.isSuccess,
          comments: List.of(
            await _commentRepository.fetchCommentsByBeaconId(state.beacon.id),
          ),
        ));
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
      final comment = await _commentRepository.addComment(
        beaconId: state.beacon.id,
        content: text,
      );
      emit(state.copyWith(
        status: FetchStatus.isSuccess,
        comments: state.comments..add(comment),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
