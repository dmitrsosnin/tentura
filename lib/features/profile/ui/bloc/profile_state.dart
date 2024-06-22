part of 'profile_cubit.dart';

final class ProfileState extends StateBase {
  const ProfileState({
    required this.user,
    super.status,
    super.error,
  });

  final User user;

  @override
  List<Object?> get props => [
        status,
        error,
        user,
      ];

  @override
  ProfileState copyWith({
    User? user,
    FetchStatus? status,
    Object? error,
  }) =>
      ProfileState(
        user: user ?? this.user,
        status: status ?? this.status,
        error: error ?? this.error,
      );

  @override
  ProfileState setError(Object error) => ProfileState(
        status: FetchStatus.isFailure,
        user: user,
        error: error,
      );

  @override
  ProfileState setLoading() => ProfileState(
        status: FetchStatus.isLoading,
        user: user,
      );
}
