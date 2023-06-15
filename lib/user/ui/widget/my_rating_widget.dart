import 'package:flutter/material.dart';

class MyRatingWidget extends StatelessWidget {
  const MyRatingWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        child: ListTile(
          leading: IconButton.filled(
            icon: const Icon(
              Icons.earbuds_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          title: const Text('My rating'),
          subtitle: const Text('71%'),
          trailing: FilledButton(
            child: const Text('Learn more'),
            onPressed: () {},
          ),
        ),
      );
}
