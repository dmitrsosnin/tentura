import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

@immutable
sealed class NodeDetails extends Equatable {
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

  @override
  List<Object> get props => [id, label, score, hasImage];
}

class UserNode extends NodeDetails {
  const UserNode({
    super.id,
    super.label,
    super.score,
    super.hasImage,
  });
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
}

class CommentNode extends NodeDetails {
  const CommentNode({
    super.id,
    super.score,
  });
}
