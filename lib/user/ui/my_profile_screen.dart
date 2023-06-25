import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gravity/_shared/consts.dart';
import 'package:gravity/user/bloc/my_profile_cubit.dart';
import 'package:gravity/_shared/ui/dialog/on_error_dialog.dart';

import 'widget/my_rating_widget.dart';
import 'widget/my_profile_header.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MyProfileCubit(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.share_rounded),
            onPressed: () {},
          ),
          body: Column(children: [
            // Header
            const MyProfileHeader(),
            // Body
            BlocConsumer<MyProfileCubit, MyProfileState>(
              listenWhen: (p, c) => p.status != c.status,
              listener: (context, state) {
                switch (state.status) {
                  case MyProfileStatus.initial:
                    if (state.profile.isEmpty) context.go(pathLogin);
                    break;
                  case MyProfileStatus.error:
                    OnErrorDialog.show(
                      context,
                      text: state.error.toString(),
                    );
                    break;
                  default:
                }
              },
              buildWhen: (p, c) => p.status != c.status,
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                final textTheme = Theme.of(context).textTheme;
                final cubit = context.read<MyProfileCubit>();
                return RefreshIndicator(
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
                                    maxLines: 1,
                                    maxLength: titleMaxLength,
                                    controller: TextEditingController(
                                      text: state.profile.displayName,
                                    ),
                                    style: textTheme.headlineLarge,
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                    ),
                                    onChanged: cubit.updateDisplayName,
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
                                  state.profile.displayName.isEmpty
                                      ? 'No name'
                                      : state.profile.displayName,
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
          ]),
        ),
      );
}
