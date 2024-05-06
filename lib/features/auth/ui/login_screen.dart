import 'package:flutter/services.dart';

import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/dialog/qr_scan_dialog.dart';

import '../domain/exception.dart';
import 'bloc/auth_cubit.dart';
import 'widget/account_list_tile.dart';

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
              text: state.error?.toString() ?? 'Unknown error!',
            );
        }
      },
      builder: (context, state) {
        final accounts = state.accounts.entries.indexed;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Choose account'),
          ),
          body: SafeArea(
            minimum: paddingH20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (state.accounts.isEmpty)
                  const Padding(
                    padding: paddingAll20,
                    child: Text(
                      'You can add your account by\n'
                      'scanning a QR from your other device\n'
                      'or using a saved seed.',
                      textAlign: TextAlign.center,
                    ),
                  )
                else
                  // Accounts list
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.accounts.keys.length,
                    itemBuilder: (context, index) => AccountListTile(
                      id: accounts.elementAt(index).$2.key,
                      seed: accounts.elementAt(index).$2.value,
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                  ),

                // Create from seed (QR)
                Padding(
                  padding: paddingAll20,
                  child: OutlinedButton(
                    child: const Text('Add account by QR'),
                    onPressed: () async =>
                        authCubit.addAccount(await QRScanDialog.show(context)),
                  ),
                ),

                // Create from seed (clipboard)
                Padding(
                  padding: paddingAll20,
                  child: OutlinedButton(
                    child: const Text('Add account by seed'),
                    onPressed: () async {
                      if (await Clipboard.hasStrings() && context.mounted) {
                        await authCubit.addAccount(
                            (await Clipboard.getData(Clipboard.kTextPlain))
                                ?.text);
                      }
                    },
                  ),
                ),

                const Spacer(),

                // Create new account
                Padding(
                  padding: paddingAll20,
                  child: FilledButton(
                    onPressed: authCubit.signUp,
                    child: const Text('Create new'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
