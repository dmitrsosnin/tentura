import 'package:equatable/equatable.dart';

import 'package:gravity/types.dart';

class Comment extends Equatable {
  static const fragment = '''
fragment commentFields on comment {
  id
  user_id
  beacon_id
  created_at
  content
}
''';

  final String id;
  final String userId;
  final String content;
  final String beaconId;
  final DateTime createdAt;

  const Comment({
    required this.id,
    required this.userId,
    required this.beaconId,
    required this.createdAt,
    required this.content,
  });

  factory Comment.fromJson(Json json) {
    return Comment(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      beaconId: json['beacon_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      content: json['content'] as String,
    );
  }

  @override
  List<Object> get props => [
        id,
        userId,
        beaconId,
        createdAt,
        content,
      ];
}
