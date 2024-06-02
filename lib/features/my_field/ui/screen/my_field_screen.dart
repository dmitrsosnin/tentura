import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../bloc/my_field_cubit.dart';
import '../widget/beacon_tile.dart';

class MyFieldScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeField,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => BlocProvider(
          create: (context) => MyFieldCubit.build(
            id: context.read<AuthCubit>().state.currentAccount,
            gqlClient: context.read<Client>(),
          ),
          child: const MyFieldScreen(),
        ),
      );

  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: paddingH20,
        child: BlocConsumer<MyFieldCubit, MyFieldState>(
          listenWhen: (p, c) => c.hasError,
          listener: (context, state) {
            showSnackBar(
              context,
              isError: true,
              text: state.error?.toString(),
            );
          },
          buildWhen: (p, c) => c.hasNoError,
          builder: (context, state) {
            final decoration = BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            );
            return RefreshIndicator.adaptive(
              onRefresh: context.read<MyFieldCubit>().fetch,
              child: ListView.builder(
                itemCount: state.beacons.length,
                itemBuilder: (context, i) => Container(
                  decoration: decoration,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: BeaconTile(beacon: state.beacons[i]),
                ),
              ),
            );
          },
        ),
      );
}
