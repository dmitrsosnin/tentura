import 'package:gravity/ui/ferry_utils.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Mark all as read'),
            )
          ],
        ),
        body: Center(
            child: Text(
          'Nothing here yet',
          style: Theme.of(context).textTheme.displaySmall,
        )),
      );
}
