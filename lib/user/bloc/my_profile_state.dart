part of 'my_profile_cubit.dart';

@immutable
class MyProfileState extends Equatable {
  final String id, uid, displayName, description, photoUrl;
  final Object error;

  const MyProfileState({
    this.id = '',
    this.uid = '',
    this.displayName = '',
    this.description = '',
    this.photoUrl = '',
    this.error = false,
  });

  factory MyProfileState.fromEntity(User user) => MyProfileState(
        id: user.id,
        uid: user.uid,
        displayName: user.displayName,
        description: user.description,
        photoUrl: user.photoUrl,
      );

  @override
  List<Object> get props => [id, uid, displayName, description, photoUrl];

  bool get isLoading => id.isEmpty;

  bool get hasError => error is Exception;

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
