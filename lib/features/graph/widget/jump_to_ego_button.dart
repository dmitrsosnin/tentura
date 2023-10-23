import 'package:flutter/material.dart';

import 'package:gravity/features/graph/bloc/graph_cubit.dart';

class JumpToEgoButton extends StatelessWidget {
  const JumpToEgoButton({super.key});

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: context.read<GraphCubit>().jumpToEgo,
        child: const Text('Ego'),
      );
}
