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
        body: const Center(
          child: Text(
            'Nothing here yet\nFind your friends to get started!',
            textAlign: TextAlign.center,
          ),
        ),
        floatingActionButton: const ShowGraphFAB(heroTag: 'FAB.Graph.MyField'),
      );
}
