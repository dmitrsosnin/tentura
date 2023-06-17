part of 'my_profile_cubit.dart';

@immutable
class MyProfileState extends Equatable {
  final String id, uid, displayName, description, photoUrl;
  final bool isLoading, isEditing;
  final Object error;

  const MyProfileState({
    this.id = '',
    this.uid = '',
    this.photoUrl = '',
    this.displayName = '',
    this.description = '',
    this.isLoading = false,
    this.isEditing = false,
    this.error = false,
  });

  factory MyProfileState.fromEntity(User user) => MyProfileState(
        id: user.id,
        uid: user.uid,
        displayName: user.displayName,
        description: user.description,
      );

  @override
  List<Object> get props => [
        id,
        uid,
        displayName,
        description,
        photoUrl,
        isLoading,
        isEditing,
        error,
      ];

  bool get hasError => error is Exception;

  MyProfileState copyWith({
    String? id,
    String? uid,
    String? displayName,
    String? description,
    String? photoUrl,
    bool? isLoading,
    bool? isEditing,
    Object? error,
  }) =>
      MyProfileState(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        photoUrl: photoUrl ?? this.photoUrl,
        displayName: displayName ?? this.displayName,
        description: description ?? this.description,
        isLoading: isLoading ?? this.isLoading,
        isEditing: isEditing ?? this.isEditing,
        error: error ?? this.error,
      );
}
