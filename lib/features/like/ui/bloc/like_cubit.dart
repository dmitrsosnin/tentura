import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/like_repository.dart';
import 'like_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'like_state.dart';

@lazySingleton
class LikeCubit extends Cubit<LikeState> {
  LikeCubit(this._likeRepository) : super(const LikeState());

  final LikeRepository _likeRepository;

  Future<int?> likeBeacon({
    required int amount,
    required String beaconId,
  }) async {
    emit(state.setLoading());
    try {
      final result = await _likeRepository.likeBeacon(
        id: beaconId,
        amount: amount,
      );
      if (result == null) {
        emit(state.setError(Exception('Can`t set like for [$beaconId]')));
      } else {
        state.likes[beaconId] = result;
        emit(LikeState(likes: state.likes));
      }
      return result;
    } catch (e) {
      emit(state.setError(e));
      return null;
    }
  }
}
