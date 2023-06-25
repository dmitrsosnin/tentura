import 'dart:io';
import 'package:flutter/material.dart';

import 'package:gravity/user/bloc/my_profile_cubit.dart';
import 'package:gravity/user/ui/dialog/on_log_out_dialog.dart';
import 'package:gravity/_shared/ui/widget/placeholder_image.dart';
import 'package:gravity/_shared/ui/widget/future_image.dart';

import 'profile_gradient.dart';

class MyProfileHeader extends StatelessWidget {
  const MyProfileHeader({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MyProfileCubit, MyProfileState>(
        buildWhen: (p, c) =>
            p.status != c.status ||
            p.newPicturePath != c.newPicturePath ||
            p.profile.hasPicture != c.profile.hasPicture,
        builder: (context, state) => Stack(
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: [
            // Gradient
            const ProfileGradient(),
            // Avatar
            Positioned(
              top: 100,
              left: 50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 8, color: Colors.white),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: state.newPicturePath.isNotEmpty
                      ? Image.file(
                          File(state.newPicturePath),
                          fit: BoxFit.cover,
                        )
                      : state.profile.hasPicture
                          ? FutureImage(
                              placeholder: const PlaceholderImage.avatar(),
                              futureImage: context
                                  .read<MyProfileCubit>()
                                  .getAvatarImageOf(state.profile.id),
                            )
                          : const PlaceholderImage.avatar(),
                ),
              ),
            ),
            // Upload\Remove Picture Button
            Positioned(
              top: 225,
              left: 200,
              child: Visibility(
                visible: state.isEditing,
                child: state.profile.hasPicture
                    ? IconButton.filledTonal(
                        key: const Key('Profile.Button:RemovePhoto'),
                        iconSize: 50,
                        onPressed: context.read<MyProfileCubit>().removePhoto,
                        icon: const Icon(Icons.highlight_remove_outlined),
                      )
                    : IconButton.filledTonal(
                        key: const Key('Profile.Button:UploadPhoto'),
                        iconSize: 50,
                        onPressed: context.read<MyProfileCubit>().uploadPhoto,
                        icon: const Icon(Icons.add_a_photo_outlined),
                      ),
              ),
            ),
            // Sign Out Button
            Positioned(
              key: const Key('Profile.Button:SignOut'),
              top: 140,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.logout_rounded),
                onPressed: () async => context
                    .read<MyProfileCubit>()
                    .signOut(await OnLogOutDialog.show(context)),
              ),
            ),
          ],
        ),
      );
}
