import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import '../bloc/friends_cubit.dart';
import '../widgets/friend_list_tile.dart';

@RoutePage()
class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Friends'),
          actions: [
            // More button
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocConsumer<FriendsCubit, FriendsState>(
          bloc: GetIt.I<FriendsCubit>(),
          listenWhen: (p, c) => c.hasError,
          listener: showSnackBarError,
          buildWhen: (p, c) => c.hasNoError,
          builder: (context, state) {
            if (state.friends.isEmpty) {
              return Center(
                child: Text(
                  'There is nothing here yet',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              );
            }
            final friends = state.friends.values.toList();

            // Friends List
            return ListView.separated(
              padding: kPaddingAll,
              itemCount: friends.length,
              itemBuilder: (context, i) {
                final profile = friends[i];
                return FriendListTile(
                  key: ValueKey(profile),
                  profile: profile,
                );
              },
              separatorBuilder: (context, i) => const Divider(),
            );
          },
        ),
      );
}
