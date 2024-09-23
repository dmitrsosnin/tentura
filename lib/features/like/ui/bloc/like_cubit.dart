import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/comment/domain/entity/comment.dart';
import 'package:tentura/features/profile/domain/entity/profile.dart';

import '../../data/like_repository.dart';
import '../../domain/exception.dart';
import 'like_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'like_state.dart';

@lazySingleton
class LikeCubit extends Cubit<LikeState> {
  LikeCubit(this._likeRepository) : super(const LikeState());

  final _beaconLikes = <String, int?>{};
  final _commentLikes = <String, int?>{};
  final _userLikes = <String, int?>{};

  final LikeRepository _likeRepository;

  int getLikeAmount(Object entity) => switch (entity) {
        final Beacon b => _beaconLikes[b.id] ?? b.myVote,
        final Comment c => _commentLikes[c.id] ?? c.myVote,
        final Profile p => _userLikes[p.id] ?? p.myVote,
        _ => throw LikeWrongTypeException(entity.runtimeType.toString()),
      };

  Future<int> setLikeAmount({
    required Object entity,
    required int amount,
  }) async {
    try {
      final result = switch (entity) {
        final Beacon b => _beaconLikes[b.id] =
            await _likeRepository.likeBeacon(beaconId: b.id, amount: amount),
        final Comment c => _commentLikes[c.id] =
            await _likeRepository.likeComment(commentId: c.id, amount: amount),
        final Profile p => _userLikes[p.id] =
            await _likeRepository.likeUser(userId: p.id, amount: amount),
        _ => throw LikeWrongTypeException(entity.runtimeType.toString()),
      };
      if (result == null) throw LikeSetException(entity.toString());
      emit(const LikeState());
      return result;
    } catch (e) {
      emit(state.setError(e));
      return amount;
    }
  }

  Future<int?> likeBeacon({
    required String beaconId,
    required int amount,
  }) async {
    emit(state.setLoading());
    try {
      final result = await _likeRepository.likeBeacon(
        beaconId: beaconId,
        amount: amount,
      );
      if (result == null) {
        emit(state.setError(LikeSetException(beaconId)));
      } else {
        state.beaconLikes[beaconId] = result;
        emit(LikeState(
          beaconLikes: state.beaconLikes,
          commentLikes: state.commentLikes,
          userLikes: state.userLikes,
        ));
      }
      return result;
    } catch (e) {
      emit(state.setError(e));
      return null;
    }
  }

  Future<int> likeComment({
    required String commentId,
    required int amount,
  }) async {
    emit(state.setLoading());
    try {
      final result = await _likeRepository.likeComment(
        commentId: commentId,
        amount: amount,
      );
      if (result == null) throw LikeSetException(commentId);
      _commentLikes[commentId] = result;
      emit(const LikeState());
      return result;
    } catch (e) {
      emit(state.setError(e));
    }
    return amount;
  }

  Future<int?> likeUser({
    required String userId,
    required int amount,
  }) async {
    emit(state.setLoading());
    try {
      final result = await _likeRepository.likeUser(
        userId: userId,
        amount: amount,
      );
      if (result == null) {
        emit(state.setError(LikeSetException(userId)));
      } else {
        state.userLikes[userId] = result;
        emit(LikeState(
          beaconLikes: state.beaconLikes,
          commentLikes: state.commentLikes,
          userLikes: state.userLikes,
        ));
      }
      return result;
    } catch (e) {
      emit(state.setError(e));
      return null;
    }
  }
}
