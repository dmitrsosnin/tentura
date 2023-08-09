import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';

sealed class GraphNode {
  const GraphNode();

  String get title;
}

class UserNode extends GraphNode {
  final GUserFields user;

  const UserNode({required this.user});

  @override
  String get title => user.title;
}

class BeaconNode extends GraphNode {
  final GBeaconFields beacon;

  const BeaconNode({required this.beacon});

  @override
  String get title => beacon.title;
}
