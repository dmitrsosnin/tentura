// import 'package:flutter/material.dart';

// import 'package:gravity/entity/graph_node.dart';
// import 'package:gravity/ui/widget/avatar_image.dart';
// import 'package:gravity/ui/widget/beacon_image.dart';

// class GraphNodeWidget extends StatelessWidget {
//   static final _decorationUser = BoxDecoration(
//     border: Border.all(color: Colors.deepPurple, width: 3),
//   );

//   static final _decorationBeacon = BoxDecoration(
//     border: Border.all(color: Colors.deepPurple, width: 2),
//   );

//   const GraphNodeWidget({
//     required this.node,
//     this.onTap,
//     super.key,
//   });

//   final GraphNode node;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) => GestureDetector(
//         onTap: onTap,
//         child: switch (node) {
//           final UserNode node => Container(
//               width: node.size,
//               height: node.size,
//               foregroundDecoration: _decorationUser,
//               child: AvatarImage(
//                 size: 40,
//                 userId: node.user.hasPicture ? node.user.id : '',
//               ),
//             ),
//           final BeaconNode node => Container(
//               width: node.size,
//               height: node.size,
//               foregroundDecoration: _decorationBeacon,
//               child: BeaconImage(
//                 authorId: node.beacon.author.id,
//                 beaconId: node.beacon.hasPicture ? node.beacon.id : '',
//               ),
//             ),
//         },
//       );
// }
