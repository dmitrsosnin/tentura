import 'package:flutter/material.dart';

import 'package:tentura/app/router.dart';
import 'package:tentura/features/graph/bloc/graph_cubit.dart';
import 'package:tentura/features/graph/widget/graph_body.dart';
import 'package:tentura/ui/utils/state_base.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => GraphCubit(
          focus: GoRouterState.of(context).uri.queryParameters['focus'],
        ),
        lazy: false,
        child: BlocConsumer<GraphCubit, GraphState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => <PopupMenuEntry<void>>[
                    PopupMenuItem<void>(
                      onTap: context.read<GraphCubit>().jumpToEgo,
                      child: const Text('Go to Ego'),
                    ),
                    const PopupMenuDivider(),
                    PopupMenuItem<void>(
                      onTap: context.read<GraphCubit>().togglePositiveOnly,
                      child: state.positiveOnly
                          ? const Text('Show negative')
                          : const Text('Hide negative'),
                    ),
                  ],
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(4),
                child: Offstage(
                  offstage: !state.isLoading,
                  child: const LinearProgressIndicator(),
                ),
              ),
              title: const Text('Graph view'),
            ),
            body: switch (state.status) {
              FetchStatus.isEmpty || FetchStatus.isLoading => Container(),
              _ => GraphBody(
                  controller: context.read<GraphCubit>().graphController,
                ),
            },
          ),
          buildWhen: (p, c) =>
              p.status != c.status || p.positiveOnly != c.positiveOnly,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text((state.error ?? 'Undescribed error').toString()),
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
            ));
          },
          listenWhen: (p, c) => c.hasError,
        ),
      );
}
