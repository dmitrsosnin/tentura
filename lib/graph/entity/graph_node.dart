import 'package:equatable/equatable.dart';

import 'package:gravity/user/entity/user.dart';

sealed class GraphNode extends Equatable {
  final double size;
  final bool isActive;

  const GraphNode({
    required this.size,
    required this.isActive,
  });
}

class UserNode extends GraphNode {
  final User user;

  const UserNode({
    required this.user,
    required super.size,
    required super.isActive,
  });

  @override
  List<Object> get props => [
        isActive,
        size,
        user,
      ];
}
