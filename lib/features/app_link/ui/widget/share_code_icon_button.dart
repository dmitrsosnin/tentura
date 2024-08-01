import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';

import '../dialog/share_code_dialog.dart';

class ShareCodeIconButton extends StatelessWidget {
  const ShareCodeIconButton({
    required this.header,
    required this.link,
    super.key,
  });

  ShareCodeIconButton.id(String id, {Key? key})
      : this(
          header: id,
          link: Uri.https(
            appLinkBase,
            pathSharedView,
            {'id': id},
          ),
          key: key,
        );

  final String header;
  final Uri link;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.share_outlined),
        onPressed: () => ShareCodeDialog.show(
          context,
          link: link,
          header: header,
        ),
      );
}
