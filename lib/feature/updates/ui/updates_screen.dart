import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Updates'),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Mark all as read'),
              )
            ],
            bottom: const TabBar(
              tabs: [
                Text('Updates'),
                Text('Comments'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'You don’t have more updates to review',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Nothing here yet',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
}
