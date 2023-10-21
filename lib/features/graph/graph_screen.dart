import 'package:gravity/app/router.dart';
import 'package:gravity/features/graph/bloc/graph_cubit.dart';
import 'package:gravity/ui/ferry_utils.dart';

import 'widget/graph_body.dart';
import 'widget/jump_to_center_button.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ego = GoRouterState.of(context).uri.queryParameters['ego'] ?? '';
    return BlocProvider(
      create: (context) => GraphCubit(
        ego: ego,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Graph view'),
          actions: const [
            JumpToCenterButton(),
          ],
        ),
        body: const GraphBody(),
      ),
    );
  }
}
