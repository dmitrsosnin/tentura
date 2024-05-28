import '_g/comment.data.gql.dart';

extension type const Comment(GCommentFields i) implements GCommentFields {
  factory Comment.fromJson(Map<String, Object?> json) =>
      GCommentFieldsData.fromJson(json)! as Comment;
}
