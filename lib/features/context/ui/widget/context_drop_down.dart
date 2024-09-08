import 'dart:async';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import '../../domain/entity/context.dart';
import '../bloc/context_cubit.dart';
import '../dialog/context_add_dialog.dart';
import '../dialog/context_remove_dialog.dart';

class ContextDropDown extends StatelessWidget {
  const ContextDropDown({
    required this.onChanged,
    super.key,
  });

  final Future<void> Function(String) onChanged;

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ContextCubit, ContextState>(
        builder: (context, state) => DropdownButton<Context>(
          isExpanded: true,
          items: [
            const DropdownMenuItem(
              value: ContextNew(),
              child: Text('Add new context'),
            ),
            const DropdownMenuItem(
              value: ContextAll(),
              child: Text('All contexts'),
            ),
            for (final e in state.contexts)
              DropdownMenuItem(
                value: ContextValue(e),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e),
                    if (state.selected == e)
                      IconButton(
                        icon: const Icon(Icons.delete_forever),
                        onPressed: () async {
                          final isCurrent = await ContextRemoveDialog.show(
                            context,
                            contextName: e,
                          );
                          if (isCurrent == null) return;
                          if (isCurrent) unawaited(onChanged(''));
                          if (context.mounted) await context.maybePop();
                        },
                      ),
                  ],
                ),
              ),
          ],
          onChanged: (value) => switch (value) {
            const ContextNew() => ContextAddDialog.show(context)
                .then((v) => v == null ? null : onChanged(v)),
            const ContextAll() =>
              onChanged(context.read<ContextCubit>().select('')),
            final ContextValue c =>
              onChanged(context.read<ContextCubit>().select(c.name)),
            _ => null,
          },
          value: switch (state.selected) {
            '' => const ContextAll(),
            final c => ContextValue(c),
          },
        ),
        listenWhen: (p, c) => c.hasError,
        listener: showSnackBarError,
      );
}
