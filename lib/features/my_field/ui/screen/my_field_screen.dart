import 'package:flutter/foundation.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/dialog/qr_scan_dialog.dart';

import 'package:tentura/features/my_field/ui/bloc/my_field_cubit.dart';
import 'package:tentura/features/my_field/ui/dialog/input_code_dialog.dart';
import 'package:tentura/features/my_field/ui/widget/feed_tab.dart';

enum FeedFilter { feed, pinned, hidden }

class MyFieldScreen extends StatefulWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeField,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const MyFieldScreen(),
      );

  const MyFieldScreen({super.key});

  @override
  State<MyFieldScreen> createState() => _MyFieldScreenState();
}

class _MyFieldScreenState extends State<MyFieldScreen> {
  final _key = GlobalKey<ExpandableFabState>();

  @override
  void dispose() {
    _key.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MyFieldCubit(),
        child: Scaffold(
          body: const SafeArea(
            child: FeedTab(),
          ),
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: ExpandableFab(
            key: _key,
            children: [
              FloatingActionButton(
                heroTag: null,
                tooltip: 'Input Code',
                child: const Icon(Icons.input_outlined),
                onPressed: () async {
                  _key.currentState?.toggle();
                  final code = await showDialog<String?>(
                    context: context,
                    builder: (context) => const InputCodeDialog(),
                  );
                  if (context.mounted) _goWithCode(context, code);
                },
              ),
              FloatingActionButton(
                heroTag: null,
                tooltip: 'Scan QR',
                child: const Icon(Icons.qr_code_scanner_outlined),
                onPressed: () async {
                  _key.currentState?.toggle();
                  final code = await QRScanDialog.show(context);
                  if (context.mounted) _goWithCode(context, code);
                },
              ),
            ],
          ),
        ),
      );

  void _goWithCode(BuildContext context, String? code) {
    if (code != null && code.length == idLength) {
      if (kDebugMode) print(code);
      if (code.startsWith('B')) {
        context.push(Uri(
          path: pathBeaconView,
          queryParameters: {'id': code},
        ).toString());
      } else if (code.startsWith('U')) {
        context.push(Uri(
          path: pathHomeProfile,
          queryParameters: {'id': code},
        ).toString());
      } else if (code.startsWith('C')) {
        // TBD
        ScaffoldMessenger.of(context).showSnackBar(notImplementedSnackBar);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Wrong code!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          behavior: SnackBarBehavior.floating,
          margin: paddingH20,
          showCloseIcon: true,
        ));
      }
    }
  }
}
