import 'package:flutter/material.dart';

import 'package:gravity/data/gql/beacon/_g/_fragments.data.gql.dart';

class BeaconPopupMenu extends StatelessWidget {
  final GBeaconFields beacon;
  final bool isMine;

  const BeaconPopupMenu({
    required this.beacon,
    required this.isMine,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PopupMenuButton(
        itemBuilder: (context) => isMine
            ? const [
                PopupMenuItem<void>(
                  child: Text('Disable beacon'),
                ),
                PopupMenuItem<void>(
                  child: Text('Share the code'),
                ),
                PopupMenuItem<void>(
                  child: Text('Graph view'),
                ),
              ]
            : const [
                PopupMenuItem<void>(
                  child: Text('Hide from My field'),
                ),
                PopupMenuItem<void>(
                  child: Text('Share the code'),
                ),
              ],
      );
}
