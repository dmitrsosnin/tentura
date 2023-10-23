import 'package:flutter_test/flutter_test.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/domain/entity/node_details.dart';

void main() {
  const userNode1 = UserNode(
    id: 'U1',
  );
  const userNode2 = UserNode(
    id: 'U2',
  );
  final beaconNode1 = BeaconNode(
    id: 'B1',
    userId: userNode1.id,
  );
  final beaconNode2 = BeaconNode(
    id: 'B2',
    userId: userNode2.id,
  );
  final commentNode1 = CommentNode(
    id: 'C1',
    userId: userNode1.id,
    beaconId: beaconNode1.id,
  );
  final commentNode2 = CommentNode(
    id: 'C2',
    userId: userNode2.id,
    beaconId: beaconNode2.id,
  );

  test('test set 1', () {
    final s = <NodeDetails>{
      userNode1,
      userNode2,
      beaconNode1,
      beaconNode2,
      commentNode1,
      commentNode2,
    };

    expect(s.length, 6);
  });

  test('test set 2', () {
    final s = <Node<NodeDetails>>{
      const Node(data: userNode1, size: 40),
      const Node(data: userNode2, size: 40),
      Node(data: beaconNode1, size: 40),
      Node(data: beaconNode2, size: 40),
      Node(data: commentNode1, size: 40),
      Node(data: commentNode2, size: 40),
    };

    expect(s.length, 6);
  });
}
