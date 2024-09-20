import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/like_repository.dart';
import '../../domain/exception.dart';
import 'like_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'like_state.dart';

@lazySingleton
class LikeCubit extends Cubit<LikeState> {
  LikeCubit(this._likeRepository) : super(const LikeState());

  final LikeRepository _likeRepository;

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

  Future<int?> likeComment({
    required String commentId,
    required int amount,
  }) async {
    emit(state.setLoading());
    try {
      final result = await _likeRepository.likeComment(
        commentId: commentId,
        amount: amount,
      );
      if (result == null) {
        emit(state.setError(LikeSetException(commentId)));
      } else {
        state.commentLikes[commentId] = result;
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
