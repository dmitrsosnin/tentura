import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import '../bloc/beacon_cubit.dart';

class BeaconDeleteDialog extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    required String id,
  }) =>
      showDialog(
        context: context,
        builder: (context) => BeaconDeleteDialog(id: id),
      );

  const BeaconDeleteDialog({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Are you sure you want to delete this beacon?'),
        actions: [
          TextButton(
            onPressed: () async {
              try {
                await context.read<BeaconCubit>().delete(id);
                if (context.mounted) context.pop();
              } catch (e) {
                if (context.mounted) {
                  showSnackBar(
                    context,
                    isError: true,
                    text: e.toString(),
                  );
                }
              }
            },
            child: const Text('Delete'),
          ),
          TextButton(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
