import '_g/_fragments.data.gql.dart';

export '_g/_fragments.data.gql.dart';

extension HasImage on GUserFields {
  String get imageId => has_picture ? id : '';
}
