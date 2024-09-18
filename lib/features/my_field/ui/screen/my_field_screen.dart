import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_tile.dart';
import 'package:tentura/features/context/ui/widget/context_drop_down.dart';

import '../bloc/my_field_cubit.dart';

@RoutePage()
class MyFieldScreen extends StatelessWidget implements AutoRouteWrapper {
  const MyFieldScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocSelector<AuthCubit, AuthState, String>(
        bloc: GetIt.I<AuthCubit>(),
        selector: (state) => state.currentAccountId,
        builder: (context, accountId) => BlocProvider(
          create: (_) => MyFieldCubit(),
          key: ValueKey(accountId),
          child: this,
        ),
      );

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: const EdgeInsets.only(
            left: kSpacingDefault,
            right: kSpacingDefault,
            top: kSpacingDefault),
        child: Column(
          children: [
            // Context selector
            ContextDropDown(onChanged: context.read<MyFieldCubit>().fetch),

            // Beacons list
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
                      padding: kPaddingV,
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
