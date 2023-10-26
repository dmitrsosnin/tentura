import 'package:gravity/ui/utils/ui_consts.dart';
import 'package:gravity/ui/utils/ferry_utils.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(notImplementedSnackBar);
              },
              child: const Text('Mark all as read'),
            )
          ],
        ),
        body: Center(
          child: Text(
            'Nothing here yet',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      );
}
