part of 'profile_cubit.dart';

final class ProfileState extends StateBase {
  const ProfileState({
    required this.user,
    super.status,
    super.error,
  });

  factory ProfileState.fromJson(Map<String, dynamic> json) =>
      ProfileState(user: GUserFieldsData.fromJson(json)!);

  final GUserFields user;

  @override
  List<Object?> get props => [
        status,
        error,
        user,
      ];

  @override
  ProfileState copyWith({
    GUserFields? user,
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

  Map<String, dynamic>? toJson(ProfileState state) =>
      state.user == user ? null : state.user.toJson();
}

class UserFields extends GUserFields {
  UserFields({
    required this.id,
  });

  @override
  String id;

  @override
  // ignore: non_constant_identifier_names
  String get G__typename => 'user';

  @override
  String get description => '';

  @override
  // ignore: non_constant_identifier_names
  bool get has_picture => false;

  @override
  // ignore: non_constant_identifier_names
  int? get my_vote => null;

  @override
  String get title => '';

  @override
  Map<String, dynamic> toJson() => {};
}
