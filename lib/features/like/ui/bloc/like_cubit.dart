import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/likable_entity.dart';
import '../../domain/use_case/like_case.dart';
import '../../domain/typedef.dart';
import 'like_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'like_state.dart';

@singleton
class LikeCubit extends Cubit<LikeState> {
  LikeCubit(this._likeCase) : super(const LikeState()) {
    _authChanges.resume();
  }

  final LikeCase _likeCase;

  late final _authChanges = _likeCase.currentAccountChanges.listen(
    // ignore: prefer_const_constructors
    (id) => emit(LikeState(likes: {})),
    cancelOnError: false,
  );

  @override
  @disposeMethod
  Future<void> close() async {
    await _authChanges.cancel();
    return super.close();
  }

  Stream<LikeAmount> get likeChanges => _likeCase.likeChanges;

  Future<void> addLikeAmount({
    required LikableEntity entity,
    required int amount,
  }) async {
    try {
      state.likes[entity.id] = await _likeCase.addLikeAmount(
        amount: state.getLikeAmount(entity).amount + amount,
        entity: entity,
      );
      emit(LikeState(likes: state.likes));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
