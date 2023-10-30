import 'package:gravity/app/router.dart';
import 'package:gravity/features/rating/bloc/rating_cubit.dart';
import 'package:gravity/features/rating/widget/rating_list_tile.dart';
// import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/utils/ferry_utils.dart';
import 'package:gravity/ui/utils/ui_consts.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RatingCubit(),
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
              // final myAvatar = AvatarImage(userId: state.myId, size: 40);
              return ListView.separated(
                padding: paddingH20,
                itemCount: state.items.length,
                separatorBuilder: (context, i) => const Divider(),
                itemBuilder: (context, i) {
                  final item = state.items[i];
                  return GestureDetector(
                    onDoubleTap: () => context.push(Uri(
                      path: pathProfile,
                      queryParameters: {'id': item.user?.id},
                    ).toString()),
                    child: RatingListTile(
                      // myAvatar: myAvatar,
                      egoScore: item.egoScore,
                      userScore: item.nodeScore,
                      user: item.user!,
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
}
