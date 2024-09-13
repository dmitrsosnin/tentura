import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/ui/bloc/state_base.dart';

part 'profile_view_state.freezed.dart';

@freezed
class ProfileViewState with _$ProfileViewState, StateFetchMixin {
  const factory ProfileViewState({
    required User user,
    @Default([]) List<Beacon> beacons,
    @Default(FetchStatus.isSuccess) FetchStatus status,
    Object? error,
  }) = _ProfileViewState;

  const ProfileViewState._();

  ProfileViewState setLoading() => copyWith(status: FetchStatus.isLoading);

  ProfileViewState setError(Object error) => copyWith(
        status: FetchStatus.isFailure,
        error: error,
      );
}
