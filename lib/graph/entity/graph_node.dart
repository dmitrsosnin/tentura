import 'dart:typed_data';
import 'package:equatable/equatable.dart';

// ignore: implementation_imports
import 'package:force_directed_graphview/src/model/node.dart';

import 'package:gravity/user/entity/user.dart';
import 'package:gravity/beacon/entity/beacon.dart';

sealed class GraphNode extends Equatable implements Node {
  @override
  final double size;

  final bool isActive;
  final Future<Uint8List?>? futureImage;

  const GraphNode({
    required this.size,
    this.isActive = false,
    this.futureImage,
  });
}

class UserNode extends GraphNode {
  final User user;

  const UserNode({
    required this.user,
    required super.size,
    super.isActive,
  });

  @override
  List<Object?> get props => [
        isActive,
        size,
        futureImage,
        user,
      ];

  @override
  User get data => user;
}

class BeaconNode extends GraphNode {
  final Beacon beacon;

  const BeaconNode({
    required this.beacon,
    required super.size,
    super.isActive,
  });

  @override
  List<Object?> get props => [
        isActive,
        size,
        futureImage,
        beacon,
      ];

  @override
  Beacon get data => beacon;
}
