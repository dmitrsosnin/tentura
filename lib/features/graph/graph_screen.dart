import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/features/graph/bloc/graph_cubit.dart';

import 'widget/graph_body.dart';
import 'widget/jump_to_ego_button.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focus = GoRouterState.of(context).uri.queryParameters['focus'] ?? '';
    return BlocProvider(
      create: (context) => GraphCubit(focus: focus),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Graph view'),
          actions: const [
            JumpToEgoButton(),
          ],
        ),
        body: const GraphBody(),
      ),
    );
  }
}
