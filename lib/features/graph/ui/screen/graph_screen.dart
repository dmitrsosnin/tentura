import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/data/gql/gql_client.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../bloc/graph_cubit.dart';
import '../widget/graph_body.dart';

class GraphScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathGraph,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => BlocProvider(
          create: (context) => GraphCubit.build(
            id: context.read<AuthCubit>().state.currentAccount,
            focus: state.uri.queryParameters['focus'],
            gqlClient: context.read<Client>(),
          ),
          child: const GraphScreen(),
        ),
      );

  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                final cubit = context.read<GraphCubit>();
                return <PopupMenuEntry<void>>[
                  PopupMenuItem<void>(
                    onTap: cubit.jumpToEgo,
                    child: const Text('Go to Ego'),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<void>(
                    onTap: cubit.togglePositiveOnly,
                    child: cubit.state.positiveOnly
                        ? const Text('Show negative')
                        : const Text('Hide negative'),
                  ),
                ];
              },
            ),
          ],
          title: const Text('Graph view'),
        ),
        body: BlocListener<GraphCubit, GraphState>(
          listenWhen: (p, c) => c.status.isFailure,
          listener: (context, state) {
            showSnackBar(
              context,
              isError: true,
              text: state.error?.toString() ?? 'Undescribed error',
            );
          },
          child: const GraphBody(),
        ),
      );
}
