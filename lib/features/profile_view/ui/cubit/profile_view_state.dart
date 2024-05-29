part of 'profile_view_cubit.dart';

final class ProfileViewState extends StateBase {
  static final empty = ProfileViewState(
    user: User.empty,
  );

  ProfileViewState({
    required this.user,
    this.beacons = const [],
    super.status,
    super.error,
  });

  final User user;
  final List<Beacon> beacons;

  @override
  List<Object?> get props => [
        status,
        error,
        user,
        beacons,
      ];

  @override
  ProfileViewState copyWith({
    FetchStatus? status,
    Object? error,
    User? user,
    List<Beacon>? beacons,
  }) =>
      ProfileViewState(
        error: error ?? this.error,
        status: status ?? this.status,
        user: user ?? this.user,
        beacons: beacons ?? this.beacons,
      );

  @override
  ProfileViewState setError(Object error) => ProfileViewState(
        status: FetchStatus.isFailure,
        beacons: beacons,
        error: error,
        user: user,
      );

  @override
  ProfileViewState setLoading() => ProfileViewState(
        status: FetchStatus.isLoading,
        beacons: beacons,
        user: user,
      );
}
