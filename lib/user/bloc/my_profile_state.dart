part of 'my_profile_cubit.dart';

enum MyProfileStatus { initial, loading, editing, error }

class MyProfileState extends Equatable {
  final MyProfileStatus status;
  final Object? error;
  final User profile;
  final String newPicturePath;

  const MyProfileState({
    this.status = MyProfileStatus.initial,
    this.profile = const User(),
    this.newPicturePath = '',
    this.error,
  });

  @override
  List<Object> get props => [
        status,
        profile,
        newPicturePath,
        error ?? '',
      ];

  bool get hasError => status == MyProfileStatus.error;
  bool get isLoading => status == MyProfileStatus.loading;
  bool get isEditing => status == MyProfileStatus.editing;

  MyProfileState copyWith({
    MyProfileStatus? status,
    User? profile,
    String? newPicturePath,
    Object? error,
    bool clearError = false,
  }) =>
      MyProfileState(
        status: status ?? this.status,
        profile: profile ?? this.profile,
        newPicturePath: newPicturePath ?? this.newPicturePath,
        error: clearError ? null : error ?? this.error,
      );
}
