part of 'my_profile_cubit.dart';

class MyProfileState extends StateBase {
  final User profile;
  final bool isEditing;
  final String newPicturePath;

  const MyProfileState({
    super.status,
    super.error,
    this.profile = const User(),
    this.newPicturePath = '',
    this.isEditing = false,
  });

  @override
  List<Object> get props => [
        status,
        profile,
        isEditing,
        newPicturePath,
      ];

  MyProfileState copyWith({
    BlocDataStatus? status,
    Object? error,
    bool clearError = false,
    User? profile,
    bool? isEditing,
    String? newPicturePath,
  }) =>
      MyProfileState(
        status: status ?? this.status,
        error: clearError ? null : error ?? this.error,
        isEditing: isEditing ?? this.isEditing,
        profile: profile ?? this.profile,
        newPicturePath: newPicturePath ?? this.newPicturePath,
      );
}
