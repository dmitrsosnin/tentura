import 'package:flutter_test/flutter_test.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/features/graph/entity/node_details.dart';

void main() {
  const userNode1 = UserNode(id: 'U1');
  const userNode2 = UserNode(id: 'U2');
  const beaconNode1 = BeaconNode(id: 'B1');
  const beaconNode2 = BeaconNode(id: 'B2');
  const commentNode1 = CommentNode(id: 'C1');
  const commentNode2 = CommentNode(id: 'C2');

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
      const Node(data: beaconNode1, size: 40),
      const Node(data: beaconNode2, size: 40),
      const Node(data: commentNode1, size: 40),
      const Node(data: commentNode2, size: 40),
    };

    expect(s.length, 6);
  });
}
