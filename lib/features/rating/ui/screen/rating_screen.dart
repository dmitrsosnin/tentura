import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/features/rating/ui/bloc/rating_cubit.dart';
import 'package:tentura/features/rating/ui/widget/rating_list_tile.dart';

class RatingScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathRating,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const RatingScreen(),
      );

  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RatingCubit(
          myId: context.read<AuthCubit>().state.currentAccount,
        ),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              // Search Input
              Builder(
                builder: (context) {
                  final cubit = context.read<RatingCubit>();
                  return TextField(
                    controller: cubit.searchController,
                    focusNode: cubit.searchFocusNode,
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
                    onChanged: cubit.setSearchFilter,
                    onTapOutside: (_) => cubit.searchFocusNode.unfocus(),
                  );
                },
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
                      : context.read<RatingCubit>().clearSearchFilter,
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
          body: BlocBuilder<RatingCubit, RatingState>(
            builder: (context, state) {
              return ListView.separated(
                padding: paddingH20,
                itemCount: state.items.length,
                separatorBuilder: (context, i) => const Divider(),
                itemBuilder: (context, i) {
                  final item = state.items[i];
                  return GestureDetector(
                    onDoubleTap: () => context.push(Uri(
                      path: pathProfileView,
                      queryParameters: {'id': item.user?.id},
                    ).toString()),
                    child: RatingListTile(
                      egoScore: item.egoScore,
                      userScore: item.nodeScore,
                      user: item.user! as User,
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
}
