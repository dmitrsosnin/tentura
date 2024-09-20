import 'package:tentura/ui/bloc/state_base.dart';

part 'like_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class LikeState with _$LikeState, StateFetchMixin {
  const factory LikeState({
    @Default({}) Map<String, int> beaconLikes,
    @Default({}) Map<String, int> commentLikes,
    @Default({}) Map<String, int> userLikes,
    @Default(FetchStatus.isSuccess) FetchStatus status,
    Object? error,
  }) = _LikeState;

  const LikeState._();

  LikeState setLoading() => copyWith(status: FetchStatus.isLoading);

  LikeState setError(Object error) => copyWith(
        status: FetchStatus.isFailure,
        error: error,
      );
}
