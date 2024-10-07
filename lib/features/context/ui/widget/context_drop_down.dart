import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import '../../domain/entity/context_selection.dart';
import '../bloc/context_cubit.dart';
import '../dialog/context_add_dialog.dart';
import '../dialog/context_remove_dialog.dart';

class ContextDropDown extends StatelessWidget {
  const ContextDropDown({
    required this.onChanged,
    super.key,
  });

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = TextStyle(color: colorScheme.onSurface);
    return BlocConsumer<ContextCubit, ContextState>(
      builder: (context, state) => DropdownButton<ContextSelection>(
        dropdownColor: colorScheme.surface,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            value: const ContextSelection.add(),
            child: Text(
              'Add new topic',
              style: textStyle,
            ),
          ),
          DropdownMenuItem(
            value: const ContextSelection.all(),
            child: Text(
              'All topics',
              style: textStyle,
            ),
          ),
          for (final e in state.contexts)
            DropdownMenuItem(
              value: ContextSelection.value(e),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e, style: textStyle),
                  if (state.selected == e)
                    IconButton(
                      icon: const Icon(Icons.delete_forever),
                      onPressed: () async {
                        final isDeleted = await ContextRemoveDialog.show(
                          context,
                          contextName: e,
                        );
                        if (isDeleted ?? false) return;
                        if (context.mounted) Navigator.of(context).pop();
                      },
                    ),
                ],
              ),
            ),
        ],
        onChanged: (value) => switch (value) {
          const ContextSelection.add() => ContextAddDialog.show(context)
              .then((v) => v == null ? null : onChanged(v)),
          const ContextSelection.all() =>
            onChanged(GetIt.I<ContextCubit>().select('')),
          final ContextSelectionValue c =>
            onChanged(GetIt.I<ContextCubit>().select(c.name)),
          _ => null,
        },
        value: switch (state.selected) {
          '' => const ContextSelection.all(),
          final c => ContextSelection.value(c),
        },
      ),
      listenWhen: (p, c) => c.hasError,
      listener: showSnackBarError,
    );
  }
}
