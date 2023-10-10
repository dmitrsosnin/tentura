import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart'
    show NodeBase;

@immutable
sealed class NodeDetails extends NodeBase with EquatableMixin {
  const NodeDetails({
    String? id,
    String? label,
    bool? hasImage,
    super.size = 40,
    super.pinned,
  })  : id = id ?? '',
        label = label ?? '',
        hasImage = hasImage ?? false;

  final String id;
  final String label;
  final bool hasImage;

  @override
  List<Object> get props => [id, label, size, hasImage, pinned];
}

final class UserNode extends NodeDetails {
  const UserNode({
    super.id,
    super.label,
    super.size,
    super.hasImage,
    super.pinned,
  });
}

final class BeaconNode extends NodeDetails {
  const BeaconNode({
    String? userId,
    super.id,
    super.label,
    super.size,
    super.hasImage,
    super.pinned,
  }) : userId = userId ?? '';

  final String userId;
}

final class CommentNode extends NodeDetails {
  const CommentNode({
    super.id,
    super.size,
    super.pinned,
  });

  @override
  String get label => id;
}
