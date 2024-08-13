import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/context/ui/widget/context_drop_down.dart';

import '../bloc/graph_cubit.dart';
import '../widget/graph_body.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GraphCubit>();
    return Scaffold(
      appBar: AppBar(
        // Menu :
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
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

        // Title
        title: const Text('Graph view'),

        // Context selector
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: ContextDropDown(onChanged: cubit.setContext),
          ),
        ),
      ),

      // Graph
      body: BlocListener<GraphCubit, GraphState>(
        listenWhen: (p, c) => c.status.isFailure,
        listener: showSnackBarError,
        child: const GraphBody(),
      ),
    );
  }
}
