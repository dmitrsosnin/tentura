import 'package:flutter/material.dart';

import 'package:gravity/_shared/ui/widget/rating_button.dart';
import 'package:gravity/_shared/ui/widget/search_button.dart';
import 'package:gravity/_shared/ui/widget/qr_code_button.dart';
import 'package:gravity/_shared/ui/widget/show_graph_fab.dart';

class FieldScreen extends StatelessWidget {
  const FieldScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: const [
            SearchButton(),
            QrCodeButton(),
          ],
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: RatingButton(),
          ),
          leadingWidth: RatingButton.width,
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Nothing here yet'),
            const Text('Find your friends to get started!'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton(
                onPressed: () {},
                child: const Center(child: Text('Search')),
              ),
            ),
          ],
        )),
        floatingActionButton: const ShowGraphFAB(),
      );
}
