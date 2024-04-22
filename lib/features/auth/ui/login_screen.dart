import 'package:flutter/services.dart';

import 'package:tentura/ui/route.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/dialog/qr_scan_dialog.dart';

import '../domain/exception.dart';
import 'dialog/account_remove_dialog.dart';
import 'dialog/account_seed_dialog.dart';
import 'bloc/auth_cubit.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = GetIt.I<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: authCubit,
      listenWhen: (p, c) => c.error != null,
      listener: (context, state) {
        switch (state.error) {
          case SeedExistsException:
            showSnackBar(
              context,
              isError: true,
              text: 'Seed already exists',
            );

          case SeedIsWrongException:
            showSnackBar(
              context,
              isError: true,
              text: 'There is no correct seed!',
            );

          default:
            showSnackBar(
              context,
              isError: true,
              text: state.error.toString(),
            );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Choose id to log in or create a new'),
            actions: [
              // Create from seed (QR)
              IconButton(
                icon: const Icon(Icons.qr_code_scanner),
                tooltip: 'Scan seed QR',
                onPressed: () async =>
                    authCubit.addAccount(await QRScanDialog.show(context)),
              ),
              // Create from seed (clipboard)
              IconButton(
                icon: const Icon(Icons.content_paste),
                tooltip: 'Paste seed from clipboard',
                onPressed: () async {
                  if (await Clipboard.hasStrings() && context.mounted) {
                    await authCubit.addAccount(
                        (await Clipboard.getData(Clipboard.kTextPlain))?.text);
                  }
                },
              ),
              // Create new account
              IconButton(
                icon: const Icon(Icons.create_new_folder_outlined),
                tooltip: 'Generate a new keys and register it',
                onPressed: authCubit.signUp,
              ),
            ],
          ),
          // Account ListTile
          body: ListView(
            padding: paddingH20,
            children: [
              for (final id in state.accounts.keys)
                ListTile(
                  leading: AvatarImage(size: 40, userId: id),
                  title: Text(id),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => <PopupMenuEntry<void>>[
                      // Remove account
                      PopupMenuItem<void>(
                        child: const Text('Remove account'),
                        onTap: () =>
                            AccountRemoveDialog.show(context, id: id).then(
                          (v) {
                            if (v ?? false) authCubit.removeAccount(id);
                          },
                        ),
                      ),
                      // Share account seed
                      const PopupMenuDivider(),
                      PopupMenuItem<void>(
                        child: const Text('Share account seed'),
                        onTap: () => AccountSeedDialog.show(
                          context,
                          id: id,
                          seed: authCubit.state.accounts[id]!,
                        ),
                      ),
                    ],
                  ),
                  // Log in
                  onTap: () async {
                    await authCubit.signIn(id);
                    if (context.mounted) context.go(pathHomeProfile);
                  },
                )
            ],
          ),
        );
      },
    );
  }
}
