import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/context/ui/widget/context_drop_down.dart';

import '../bloc/my_field_cubit.dart';
import '../widget/beacon_tile.dart';

class MyFieldScreen extends StatelessWidget {
  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            ContextDropDown(
              onChanged: context.read<MyFieldCubit>().fetch,
            ),
            Expanded(
              child: BlocConsumer<MyFieldCubit, MyFieldState>(
                listenWhen: (p, c) => c.hasError,
                listener: showSnackBarError,
                buildWhen: (p, c) => c.hasNoError,
                builder: (context, state) {
                  final decoration = BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  );
                  return ListView.builder(
                    itemCount: state.beacons.length,
                    itemBuilder: (context, i) => Container(
                      decoration: decoration,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: BeaconTile(beacon: state.beacons[i]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
}
