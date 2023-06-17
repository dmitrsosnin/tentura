import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:gravity/_app/router.dart';
import 'package:gravity/_shared/consts.dart';
import 'package:gravity/user/bloc/my_profile_cubit.dart';
import 'package:gravity/user/ui/dialog/on_log_out_dialog.dart';

class ProfileHeaderWidget extends StatelessWidget {
  ProfileHeaderWidget({super.key});

  final _cubit = GetIt.I<MyProfileCubit>();
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children: [
          // Gradient
          Column(
            children: [
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
              const SizedBox(height: 50),
            ],
          ),
          // Avatar
          Positioned(
            left: 50,
            bottom: -50,
            child: BlocBuilder<MyProfileCubit, MyProfileState>(
              bloc: _cubit,
              buildWhen: (p, c) =>
                  p.photoUrl != c.photoUrl || p.isEditing != c.isEditing,
              builder: (context, state) => state.photoUrl.isEmpty
                  ? const SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : CachedNetworkImage(
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      imageUrl: state.photoUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 8, color: Colors.white),
                          image: DecorationImage(image: imageProvider),
                        ),
                        child: state.isEditing
                            ? IconButton.outlined(
                                iconSize: 48,
                                splashRadius: 48,
                                icon: const Icon(Icons.add_a_photo),
                                onPressed: () async {
                                  final file = await _picker.pickImage(
                                    source: ImageSource.gallery,
                                    imageQuality: 100,
                                    maxHeight: 1024,
                                    maxWidth: 1024,
                                  );
                                  if (file != null) {
                                    await imageProvider.evict();
                                    await _cubit.uploadPhoto(file.path);
                                  }
                                },
                              )
                            : null,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error_outline_rounded,
                        color: Colors.red,
                        size: 96,
                      ),
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator.adaptive(
                        value: progress.progress,
                      ),
                    ),
            ),
          ),
          // Sign Out Button
          Positioned(
            top: 140,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.logout_rounded),
              onPressed: () async {
                if (await OnLogOutDialog.show(context) == true) {
                  await _cubit.signOut();
                  // TBD: move navigation to screen`s BlocConsumer
                  if (context.mounted) context.go(pathLogin);
                }
              },
            ),
          ),
        ],
      );
}
