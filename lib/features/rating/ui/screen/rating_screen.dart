import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import '../bloc/rating_cubit.dart';
import '../widget/rating_list_tile.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  late final _cubit = context.read<RatingCubit>();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            // Search Input
            TextFormField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                hintText: 'Search by',
                isDense: true,
                isCollapsed: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                constraints: BoxConstraints.tightForFinite(
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
              textAlign: TextAlign.end,
              textInputAction: TextInputAction.go,
              onChanged: _cubit.setSearchFilter,
              onTapOutside: (_) => _searchFocusNode.unfocus(),
            ),
            // Clear input
            BlocBuilder<RatingCubit, RatingState>(
              buildWhen: (p, c) =>
                  p.searchFilter.isEmpty || c.searchFilter.isEmpty,
              builder: (context, s) => IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                icon: const Icon(Icons.clear_rounded),
                onPressed: s.searchFilter.isEmpty
                    ? null
                    : () {
                        _searchController.clear();
                        _cubit.clearSearchFilter();
                      },
              ),
            ),
            // Toggle sorting by value
            BlocBuilder<RatingCubit, RatingState>(
              buildWhen: (p, c) => p.isSortedByAsc != c.isSortedByAsc,
              builder: (context, state) => IconButton(
                onPressed: context.read<RatingCubit>().toggleSortingByAsc,
                icon: state.isSortedByAsc
                    ? const Icon(Icons.keyboard_arrow_up_rounded)
                    : const Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ),
            // Toggle sorting by ego
            BlocBuilder<RatingCubit, RatingState>(
              buildWhen: (p, c) => p.isSortedByEgo != c.isSortedByEgo,
              builder: (context, state) => IconButton(
                onPressed: context.read<RatingCubit>().toggleSortingByEgo,
                icon: state.isSortedByEgo
                    ? const Icon(Icons.keyboard_arrow_right_rounded)
                    : const Icon(Icons.keyboard_arrow_left_rounded),
              ),
            ),
          ],
          title: const Text('Rating'),
        ),
        body: BlocConsumer<RatingCubit, RatingState>(
          listenWhen: (p, c) => c.hasError,
          listener: (context, state) {
            showSnackBar(
              context,
              isError: true,
              text: state.error?.toString(),
            );
          },
          buildWhen: (p, c) => c.hasNoError,
          builder: (context, state) => ListView.separated(
            padding: paddingMediumH,
            itemCount: state.items.length,
            separatorBuilder: (context, i) => const Divider(),
            itemBuilder: (context, i) {
              final item = state.items[i];
              return GestureDetector(
                onDoubleTap: () => context.push(Uri(
                  path: pathProfileView,
                  queryParameters: {'id': item.user.id},
                ).toString()),
                child: RatingListTile(
                  egoScore: item.egoScore,
                  userScore: item.userScore,
                  user: item.user,
                ),
              );
            },
          ),
        ),
      );
}
