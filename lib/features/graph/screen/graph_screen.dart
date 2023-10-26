import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/features/graph/bloc/graph_cubit.dart';

import '../widget/graph_body.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focus = GoRouterState.of(context).uri.queryParameters['focus'] ?? '';
    return BlocProvider(
      create: (context) => GraphCubit(focus: focus),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<GraphCubit, GraphState>(
              buildWhen: (p, c) => p.positiveOnly != c.positiveOnly,
              builder: (context, state) => PopupMenuButton(
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
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: BlocBuilder<GraphCubit, GraphState>(
              buildWhen: (p, c) => p.status != c.status,
              builder: (context, state) => Offstage(
                offstage: !state.isLoading,
                child: const LinearProgressIndicator(),
              ),
            ),
          ),
          title: const Text('Graph view'),
        ),
        body: const GraphBody(),
      ),
    );
  }
}
