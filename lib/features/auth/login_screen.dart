import 'package:flutter/services.dart';

import 'package:tentura/app/router.dart';
import 'package:tentura/data/auth_repository.dart';
import 'package:tentura/ui/dialog/qr_scan_dialog.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';

import 'package:tentura/features/auth/dialog/account_seed_dialog.dart';
import 'package:tentura/features/auth/dialog/account_remove_dialog.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final authRepo = GetIt.I<AuthRepository>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Choose id to log in or create a new'),
          actions: [
            // Create from seed (QR)
            IconButton(
              icon: const Icon(Icons.qr_code_scanner),
              tooltip: 'Scan seed QR',
              onPressed: () async {
                final seed = await QRScanDialog.show(context);
                if (seed == null) return;
                if (seed.length < 40) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('There is no correct seed!'),
                    ));
                  }
                  return;
                }
                try {
                  await authRepo.addAccount(seed);
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        e is SeedExistsException
                            ? 'Seed already exists'
                            : 'Wrong seed!',
                      ),
                    ));
                  }
                  return;
                }
                setState(() {});
              },
            ),
            // Create from seed (clipboard)
            IconButton(
              icon: const Icon(Icons.content_paste),
              tooltip: 'Paste seed from clipboard',
              onPressed: () async {
                if (!await Clipboard.hasStrings() && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Clipboard is empty!'),
                  ));
                  return;
                }
                final seed =
                    (await Clipboard.getData(Clipboard.kTextPlain))?.text;
                if (seed == null || seed.length < 40) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('There is no correct seed!'),
                    ));
                  }
                  return;
                }
                try {
                  await authRepo.addAccount(seed);
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        e is SeedExistsException
                            ? 'Seed already exists'
                            : 'Wrong seed!',
                      ),
                    ));
                  }
                  return;
                }
                setState(() {});
              },
            ),
            // Create new account
            IconButton(
              icon: const Icon(Icons.create_new_folder_outlined),
              tooltip: 'Generate a new keys and register it',
              onPressed: () async {
                try {
                  await authRepo.createAccount();
                  setState(() {});
                } catch (e) {
                  rethrow;
                }
              },
            ),
          ],
        ),
        // Account ListTile
        body: ListView(
          padding: paddingH20,
          children: [
            for (final e in authRepo.accounts)
              ListTile(
                leading: AvatarImage(size: 40, userId: e),
                title: Text(e),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => <PopupMenuEntry<void>>[
                    // Remove account
                    PopupMenuItem<void>(
                      child: const Text('Remove account'),
                      onTap: () =>
                          AccountRemoveDialog.show(context, id: e).then(
                        (v) async {
                          if (v ?? false) {
                            await authRepo.removeAccount(e);
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    // Share account seed
                    const PopupMenuDivider(),
                    PopupMenuItem<void>(
                      child: const Text('Share account seed'),
                      onTap: () => AccountSeedDialog.show(
                        context,
                        id: e,
                        seed: authRepo.getSeed(e)!,
                      ),
                    ),
                  ],
                ),
                // Log in
                onTap: () async {
                  try {
                    await authRepo.signIn(e);
                  } catch (e) {
                    rethrow;
                  }
                  if (context.mounted) context.go(pathHomeProfile);
                },
              )
          ],
        ),
      );
}
