import 'package:flutter/material.dart';

const paddingAll8 = EdgeInsets.all(8);
const paddingAll20 = EdgeInsets.all(20);

const paddingH8 = EdgeInsets.symmetric(horizontal: 8);
const paddingH20 = EdgeInsets.symmetric(horizontal: 20);

const paddingV8 = EdgeInsets.symmetric(vertical: 8);
const paddingV20 = EdgeInsets.symmetric(vertical: 20);

const borderRadius20 = BorderRadius.all(Radius.circular(20));

const decorationRadius20 = BoxDecoration(borderRadius: borderRadius20);

const appBarBottomLine = PreferredSize(
  preferredSize: Size(double.infinity, 1),
  child: Divider(),
);

const notImplementedSnackBar = SnackBar(
  content: Text('Not implemented yet...'),
  behavior: SnackBarBehavior.floating,
  margin: paddingAll20,
  showCloseIcon: true,
);
