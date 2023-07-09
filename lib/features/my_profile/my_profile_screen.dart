import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/consts.dart';
import 'package:gravity/ui/widget/error_dialog.dart';
import 'package:gravity/features/graph/widget/show_graph_fab.dart';
import 'package:gravity/features/my_profile/bloc/my_profile_cubit.dart';

import 'widget/my_rating_widget.dart';
import 'widget/my_profile_header.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.I<MyProfileCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      floatingActionButton: const ShowGraphFAB(heroTag: 'FAB.Graph.MyProfile'),
      body: Column(
        children: [
          // Header
          const MyProfileHeader(),
          // Body
          BlocConsumer<MyProfileCubit, MyProfileState>(
            bloc: cubit,
            listener: (context, state) {
              if (state.profile.isEmpty) {
                context.go(pathLogin);
                return;
              }
              if (state.hasError) {
                showDialog<void>(
                  context: context,
                  builder: (context) => ErrorDialog(error: state.error),
                );
                return;
              }
            },
            buildWhen: (p, c) =>
                p.status != c.status || p.isEditing != c.isEditing,
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              final textTheme = Theme.of(context).textTheme;
              return RefreshIndicator.adaptive(
                onRefresh: cubit.refresh,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: state.isEditing
                      // Edit Profile
                      ? [
                          Row(
                            children: [
                              // Display Name
                              Expanded(
                                child: TextField(
                                  maxLength: titleMaxLength,
                                  controller: TextEditingController(
                                    text: state.profile.title,
                                  ),
                                  style: textTheme.headlineLarge,
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                  ),
                                  onChanged: cubit.updateTitle,
                                ),
                              ),
                              // Save Button
                              IconButton.outlined(
                                icon: const Icon(Icons.save),
                                onPressed: cubit.save,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // User Description
                          TextField(
                            minLines: 1,
                            maxLines: 10,
                            style: textTheme.bodyLarge,
                            maxLength: descriptionLength,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              labelText: 'Description',
                            ),
                            controller: TextEditingController(
                              text: state.profile.description,
                            ),
                            onChanged: cubit.updateDescription,
                          ),
                          const SizedBox(height: 40),
                          // User Rating
                          const MyRatingWidget(),
                        ]
                      // Display Profile
                      : [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Display Name
                              Text(
                                state.profile.title.isEmpty
                                    ? 'No name'
                                    : state.profile.title,
                                style: textTheme.headlineLarge,
                                maxLines: 1,
                              ),
                              // Edit Button
                              IconButton.outlined(
                                icon: const Icon(Icons.edit),
                                onPressed: cubit.edit,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // User Description
                          Text(
                            state.profile.description,
                            style: textTheme.bodyLarge,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 40),
                          // User Rating
                          const MyRatingWidget(),
                        ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
