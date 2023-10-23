import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart'
    show NodeBase;

@immutable
sealed class NodeDetails extends NodeBase with EquatableMixin {
  const NodeDetails({
    required this.id,
    this.label = '',
    this.hasImage = false,
    super.size = 40,
    super.pinned,
  });

  final String id;
  final String label;
  final bool hasImage;

  @override
  List<Object> get props => [id];

  String get userId;

  NodeDetails copyWith({
    bool? pinned,
  });
}

final class UserNode extends NodeDetails {
  const UserNode({
    required super.id,
    super.label,
    super.size,
    super.hasImage,
    super.pinned,
  });

  @override
  String get userId => id;

  @override
  NodeDetails copyWith({
    bool? pinned,
  }) =>
      UserNode(
        id: id,
        size: size,
        label: label,
        hasImage: hasImage,
        pinned: pinned ?? this.pinned,
      );
}

final class BeaconNode extends NodeDetails {
  const BeaconNode({
    required this.userId,
    required super.id,
    super.label,
    super.size,
    super.hasImage,
    super.pinned,
  });

  @override
  final String userId;

  @override
  BeaconNode copyWith({
    bool? pinned,
  }) =>
      BeaconNode(
        id: id,
        size: size,
        label: label,
        userId: userId,
        hasImage: hasImage,
        pinned: pinned ?? this.pinned,
      );
}

final class CommentNode extends NodeDetails {
  const CommentNode({
    required this.userId,
    required this.beaconId,
    required super.id,
    super.size,
    super.pinned,
  });

  @override
  final String userId;

  final String beaconId;

  @override
  String get label => id;

  @override
  CommentNode copyWith({
    bool? pinned,
  }) =>
      CommentNode(
        id: id,
        size: size,
        userId: userId,
        beaconId: beaconId,
        pinned: pinned ?? this.pinned,
      );
}
