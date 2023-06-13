import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/core/ui/dialog/on_error_dialog.dart';
import 'package:gravity/feature/user/bloc/my_profile_cubit.dart';

import 'widget/my_rating_widget.dart';
import 'widget/profile_header_widget.dart';
import 'widget/my_description_widget.dart';
import 'widget/my_display_name_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key}) {
    _cubit.refresh();
  }

  final _cubit = GetIt.I<MyProfileCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.share_rounded),
          onPressed: () {},
        ),
        body: Column(children: [
          // Header
          const ProfileHeaderWidget(),
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
                buildWhen: (p, c) => p.isLoading != c.isLoading,
                builder: (context, state) => state.isLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyDisplayNameWidget(),
                          SizedBox(height: 20),
                          MyDescriptionWidget(),
                          SizedBox(height: 20),
                          MyRatingWidget(),
                        ],
                      ),
              ),
            ),
          ),
        ]),
      );
}
