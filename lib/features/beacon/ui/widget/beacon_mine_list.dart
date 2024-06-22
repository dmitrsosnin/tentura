import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import '../bloc/beacon_cubit.dart';
import 'beacon_info.dart';
import 'beacon_mine_control.dart';

class BeaconMineList extends StatelessWidget {
  const BeaconMineList({super.key});

  @override
  Widget build(BuildContext context) => BlocConsumer<BeaconCubit, BeaconState>(
        listenWhen: (p, c) => c.hasError,
        listener: (context, state) {
          showSnackBar(
            context,
            isError: true,
            text: state.error?.toString(),
          );
        },
        builder: (context, state) => SliverList.separated(
          itemCount: state.beacons.length,
          itemBuilder: (context, i) => Padding(
            padding: paddingMediumH,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BeaconInfo(beacon: state.beacons[i]),
                Padding(
                  padding: paddingSmallV,
                  child: BeaconMineControl(beacon: state.beacons[i]),
                ),
              ],
            ),
          ),
          separatorBuilder: (_, __) => const Divider(
            endIndent: 20,
            indent: 20,
          ),
        ),
      );
}
