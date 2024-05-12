part of 'profile_cubit.dart';

final class ProfileState extends StateBase {
  const ProfileState({
    this.profile = const _ProfileEmptyState(),
    super.status,
    super.error,
  });

  final GUserFields profile;

  @override
  List<Object?> get props => [
        status,
        error,
        profile,
      ];

  @override
  ProfileState copyWith({
    GUserFields? profile,
    FetchStatus? status,
    Object? error,
  }) =>
      ProfileState(
        profile: profile ?? this.profile,
        status: status ?? this.status,
        error: error ?? this.error,
      );

  @override
  ProfileState setError(Object error) => ProfileState(
        status: FetchStatus.isFailure,
        profile: profile,
        error: error,
      );

  @override
  ProfileState setLoading() => ProfileState(
        status: FetchStatus.isLoading,
        profile: profile,
      );
}

class _ProfileEmptyState implements GUserFields {
  const _ProfileEmptyState();

  @override
  // ignore: non_constant_identifier_names
  String get G__typename => throw UnimplementedError();

  @override
  String get description => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  bool get has_picture => throw UnimplementedError();

  @override
  String get id => throw UnimplementedError();

  @override
  // ignore: non_constant_identifier_names
  int? get my_vote => throw UnimplementedError();

  @override
  String get title => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
