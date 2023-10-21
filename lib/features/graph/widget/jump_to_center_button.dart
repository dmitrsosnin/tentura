import 'package:flutter/material.dart';

import 'package:gravity/features/graph/bloc/graph_cubit.dart';

class JumpToCenterButton extends StatelessWidget {
  const JumpToCenterButton({super.key});

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: context.read<GraphCubit>().jumpToCenter,
        child: const Text('Center'),
      );
}
