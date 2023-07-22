import 'package:flutter/material.dart';

const paddingH8 = EdgeInsets.symmetric(horizontal: 8);
const paddingH20 = EdgeInsets.symmetric(horizontal: 20);

const paddingV8 = EdgeInsets.symmetric(vertical: 8);

const borderRadius20 = BorderRadius.all(Radius.circular(20));

const decorationRadius20 = BoxDecoration(borderRadius: borderRadius20);

const appBarBottomLine = PreferredSize(
  preferredSize: Size(double.infinity, 1),
  child: Divider(),
);
