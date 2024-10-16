import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';

part 'liked_beacons_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class LikedBeaconsState with _$LikedBeaconsState, StateFetchMixin {
  const factory LikedBeaconsState({
    @Default('') String context,
    @Default([]) List<Beacon> beacons,
    @Default(FetchStatus.isSuccess) FetchStatus status,
    Object? error,
  }) = _LikedBeaconsState;

  const LikedBeaconsState._();

  LikedBeaconsState setLoading() => copyWith(status: FetchStatus.isLoading);

  LikedBeaconsState setError(Object error) => copyWith(
        status: FetchStatus.isFailure,
        error: error,
      );
}
