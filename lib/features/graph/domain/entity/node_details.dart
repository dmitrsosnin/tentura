import 'package:flutter/foundation.dart';

@immutable
sealed class NodeDetails {
  const NodeDetails({
    String? id,
    String? label,
    double? score,
    bool? hasImage,
  })  : id = id ?? '',
        label = label ?? '',
        score = score ?? 0,
        hasImage = hasImage ?? false;

  final String id;
  final String label;
  final double score;
  final bool hasImage;
}

class UserNode extends NodeDetails {
  const UserNode({
    super.id,
    super.label,
    super.score,
    super.hasImage,
  });

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserNode && runtimeType == other.runtimeType && id == other.id;
}

class BeaconNode extends NodeDetails {
  const BeaconNode({
    String? userId,
    super.id,
    super.label,
    super.score,
    super.hasImage,
  }) : userId = userId ?? '';

  final String userId;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BeaconNode && runtimeType == other.runtimeType && id == other.id;
}

class CommentNode extends NodeDetails {
  const CommentNode({
    super.id,
    super.score,
  });

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentNode &&
          runtimeType == other.runtimeType &&
          id == other.id;
}
