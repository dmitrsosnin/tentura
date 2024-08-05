import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import '../bloc/context_cubit.dart';
import '../dialog/context_add_dialog.dart';

class ContextDropDown extends StatelessWidget {
  const ContextDropDown({
    this.onChanged,
    super.key,
  });

  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ContextCubit, ContextState>(
        builder: (context, state) => DropdownButtonFormField<String>(
          hint: const Text('Set context'),
          isExpanded: true,
          items: [
            DropdownMenuItem(
              child: TextButton(
                child: const Text('Add new context'),
                onPressed: () async {
                  final newContext = await ContextAddDialog.show(context);
                  if (newContext != null && context.mounted) {
                    await context.read<ContextCubit>().add(newContext);
                    if (context.mounted) context.pop();
                  }
                },
              ),
            ),
            const DropdownMenuItem(
              value: '',
              child: Text('All contexts'),
            ),
            for (final e in state.contexts)
              DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
          ],
          onChanged: onChanged,
          value: state.lastAdded,
        ),
        listenWhen: (p, c) => c.hasError,
        listener: showSnackBarError,
      );
}
