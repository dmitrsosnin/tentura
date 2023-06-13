part of 'my_profile_cubit.dart';

@immutable
class MyProfileState extends User {
  final Object error;

  const MyProfileState({
    super.id,
    super.uid,
    super.displayName,
    super.description,
    super.photoUrl,
    this.error = false,
  });

  factory MyProfileState.fromEntity(User user) => MyProfileState(
        id: user.id,
        uid: user.uid,
        displayName: user.displayName,
        description: user.description,
        photoUrl: user.photoUrl,
      );

  bool get isLoading => id.isEmpty;
  bool get hasError => error is Exception;

  @override
  MyProfileState copyWith({
    String? id,
    String? uid,
    String? displayName,
    String? description,
    String? photoUrl,
    Object? error,
  }) =>
      MyProfileState(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        description: description ?? this.description,
        photoUrl: photoUrl ?? this.photoUrl,
        error: error ?? this.error,
      );
}
