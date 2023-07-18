import 'package:flutter/material.dart';

import 'package:gravity/ui/widget/rating_button.dart';

class MyFieldScreen extends StatelessWidget {
  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8),
            child: RatingButton(),
          ),
          leadingWidth: RatingButton.width,
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {},
          child: ListView(),
        ),
      );
}
