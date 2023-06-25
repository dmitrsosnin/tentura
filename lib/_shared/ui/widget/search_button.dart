import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) => const IconButton(
        onPressed: null,
        icon: Icon(Icons.search_rounded),
      );
}
