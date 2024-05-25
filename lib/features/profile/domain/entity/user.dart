import '../../data/gql/_g/_fragments.data.gql.dart';

extension type const User(GUserFields i) implements GUserFields {
  factory User.empty(String id) {
    final user = GUserFieldsDataBuilder()
      ..id = id
      ..title = ''
      ..description = ''
      ..has_picture = false;
    return user.build() as User;
  }

  factory User.fromJson(Map<String, Object?> json) =>
      GUserFieldsData.fromJson(json)! as User;

  String get imageId => i.has_picture ? i.id : '';
}
