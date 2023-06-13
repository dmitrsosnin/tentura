import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:extended_image/extended_image.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/core/consts.dart';
import 'package:gravity/feature/user/bloc/my_profile_cubit.dart';
import 'package:gravity/feature/user/ui/dialog/on_log_out_dialog.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          children: [
            // Gradient
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF9A396),
                    Color(0xFFC52AEE),
                    Color(0xFF8829CD),
                    Color(0xFF24F6FE),
                    Color(0xFF24F6FE),
                  ],
                  stops: [
                    0.1,
                    0.3,
                    0.5,
                    0.7,
                    0.8,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.mirror,
                  transform: GradientRotation(0.3),
                ),
              ),
            ),
            // Avatar
            Positioned(
              bottom: -100,
              left: 60,
              child: BlocBuilder<MyProfileCubit, MyProfileState>(
                bloc: GetIt.I<MyProfileCubit>(),
                buildWhen: (p, c) => p.photoUrl != c.photoUrl,
                builder: (context, state) => ExtendedImage.network(
                  state.isLoading
                      // TBD: replace it with real placeholder url
                      ? 'https://replace-with-real-placeholder-url'
                      : state.photoUrl,
                  cache: true,
                  height: 200,
                  width: 200,
                  border: Border.all(width: 8, color: Colors.white),
                  borderRadius: BorderRadius.circular(100),
                  filterQuality: FilterQuality.high,
                  isAntiAlias: true,
                  loadStateChanged: (state) =>
                      switch (state.extendedImageLoadState) {
                    LoadState.failed => const Icon(Icons.error_outline_rounded),
                    LoadState.loading =>
                      const CircularProgressIndicator.adaptive(),
                    _ => null,
                  },
                ),
              ),
            ),
            // More Button
            Positioned(
              bottom: 20,
              right: 20,
              child: PopupMenuButton<void>(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text('Edit'),
                    onTap: () {},
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    child: const Text('Log out'),
                    onTap: () async {
                      if (await OnLogOutDialog.show(context) == true) {
                        await GetIt.I<MyProfileCubit>().signOut();
                        if (context.mounted) context.go(pathLogin);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
