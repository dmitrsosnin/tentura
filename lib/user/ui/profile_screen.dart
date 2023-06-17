import 'package:flutter/material.dart';

import 'package:gravity/_shared/consts.dart';
import 'package:gravity/user/bloc/my_profile_cubit.dart';
import 'package:gravity/_shared/ui/dialog/on_error_dialog.dart';

import 'widget/my_rating_widget.dart';
import 'widget/profile_header_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key}) {
    _cubit.refresh();
  }

  final _cubit = GetIt.I<MyProfileCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.share_rounded),
          onPressed: () {},
        ),
        body: Column(children: [
          // Header
          ProfileHeaderWidget(),
          // Body
          RefreshIndicator(
            onRefresh: _cubit.refresh,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocConsumer<MyProfileCubit, MyProfileState>(
                bloc: _cubit,
                listenWhen: (p, c) => p.hasError,
                listener: (context, state) {
                  if (state.hasError) {
                    OnErrorDialog.show(
                      context,
                      text: state.error.toString(),
                    );
                  }
                },
                buildWhen: (p, c) =>
                    p.isLoading != c.isLoading || p.isEditing != c.isEditing,
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  final textTheme = Theme.of(context).textTheme;
                  return ListView(
                    shrinkWrap: true,
                    children: state.isEditing
                        // Edit Profile
                        ? [
                            Row(
                              children: [
                                // Display Name
                                Expanded(
                                  child: TextField(
                                    maxLines: 1,
                                    maxLength: displayNameLength,
                                    controller: TextEditingController(
                                      text: state.displayName,
                                    ),
                                    style: textTheme.headlineLarge,
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                    ),
                                    onChanged: (v) => _cubit.newDisplayName = v,
                                  ),
                                ),
                                // Save Button
                                IconButton.outlined(
                                  icon: const Icon(Icons.save),
                                  onPressed: _cubit.save,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // User Description
                            TextField(
                              minLines: 1,
                              maxLines: 10,
                              style: textTheme.bodyLarge,
                              maxLength: userDescriptionLength,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                labelText: 'Description',
                              ),
                              controller: TextEditingController(
                                text: state.description,
                              ),
                              onChanged: (v) => _cubit.newDescription = v,
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
                                  state.displayName.isEmpty
                                      ? 'No name'
                                      : state.displayName,
                                  style: textTheme.headlineLarge,
                                  maxLines: 1,
                                ),
                                // Edit Button
                                IconButton.outlined(
                                  icon: const Icon(Icons.edit),
                                  onPressed: _cubit.edit,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // User Description
                            Text(
                              state.description,
                              style: textTheme.bodyLarge,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 40),
                            // User Rating
                            const MyRatingWidget(),
                          ],
                  );
                },
              ),
            ),
          ),
        ]),
      );
}
