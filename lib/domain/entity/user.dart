import '_g/user.data.gql.dart';

extension type const User(GUserFields i) implements GUserFields {
  static final empty = (GUserFieldsDataBuilder()
        ..id = ''
        ..title = ''
        ..description = ''
        ..has_picture = false)
      .build() as User;

  factory User.fromJson(Map<String, Object?> json) =>
      GUserFieldsData.fromJson(json)! as User;

  String get imageId => i.has_picture ? i.id : '';

  bool get isFriend => (my_vote ?? 0) > 0;

  User copyWith({
    String? id,
    String? title,
    String? description,
    bool? hasPicture,
    int? myVote,
  }) =>
      (GUserFieldsDataBuilder()
            ..id = id ?? this.id
            ..title = title ?? this.title
            ..description = description ?? this.description
            ..has_picture = hasPicture ?? has_picture
            ..my_vote = myVote ?? my_vote)
          .build() as User;
}
