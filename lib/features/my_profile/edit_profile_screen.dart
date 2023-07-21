import 'dart:io';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:ferry_flutter/ferry_flutter.dart';

import 'package:gravity/consts.dart';
import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/image_repository.dart';
import 'package:gravity/data/gql/user/_g/update_user.req.gql.dart';
import 'package:gravity/data/gql/user/_g/fetch_user_profile.req.gql.dart';
import 'package:gravity/data/gql/user/_g/fetch_user_profile.data.gql.dart';
import 'package:gravity/ui/widget/error_center_text.dart';
import 'package:gravity/ui/widget/header_gradient.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/dialog/error_dialog.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _title;
  String? _description;
  String? _newImagePath;

  @override
  Widget build(BuildContext context) => Operation(
        client: GetIt.I<Client>(),
        operationRequest: GFetchUserProfileReq(
          (b) => b..vars.id = GetIt.I<AuthRepository>().myId,
        ),
        builder: (context, response, error) {
          if (response?.loading ?? false) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (response?.data?.user_by_pk == null) {
            return ErrorCenterText(response: response, error: error);
          }
          final profile = response!.data!.user_by_pk!;
          final textTheme = Theme.of(context).textTheme;
          return Scaffold(
            appBar: AppBar(
              actions: [
                // Save Button
                IconButton.outlined(
                  icon: const Icon(Icons.save),
                  onPressed: () => _onSavePressed(profile),
                ),
                const SizedBox(width: 12),
              ],
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                // Header
                Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.passthrough,
                  children: [
                    // Gradient
                    const HeaderGradient(),
                    // Avatar
                    Positioned(
                      top: 100,
                      left: 50,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 8,
                            color: Colors.white,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: _newImagePath == null
                            ? AvatarImage(
                                size: 200,
                                userId: profile.has_picture ? profile.id : '',
                              )
                            : Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.file(
                                  File(_newImagePath!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    // Upload\Remove Picture Button
                    Positioned(
                      top: 225,
                      left: 200,
                      child: profile.has_picture
                          ? IconButton.filledTonal(
                              iconSize: 50,
                              icon: const Icon(Icons.highlight_remove_outlined),
                              onPressed: () => _newImagePath = null,
                            )
                          : IconButton.filledTonal(
                              iconSize: 50,
                              icon: const Icon(Icons.add_a_photo_outlined),
                              onPressed: _onPickImagePressed,
                            ),
                    ),
                  ],
                ),
                // Username
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: TextField(
                    maxLength: titleMaxLength,
                    controller: TextEditingController(
                      text: _title ?? profile.title,
                    ),
                    style: textTheme.headlineLarge,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    onChanged: (value) => _title = value,
                  ),
                ),
                // User Description
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: TextField(
                    minLines: 1,
                    maxLines: 10,
                    style: textTheme.bodyLarge,
                    maxLength: descriptionLength,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    controller: TextEditingController(
                      text: _description ?? profile.description,
                    ),
                    onChanged: (value) => _description = value,
                  ),
                ),
              ],
            ),
          );
        },
      );

  Future<void> _onPickImagePressed() async {
    final image = await GetIt.I<ImageRepository>().pickImage();
    if (image != null) setState(() => _newImagePath = image.path);
  }

  Future<void> _onSavePressed(GFetchUserProfileData_user_by_pk profile) async {
    if (_title == null && _description == null && _newImagePath == null) {
      return context.pop();
    }
    if ((_title ?? profile.title).length < titleMinLength) {
      return ErrorDialog.show(
        context: context,
        error: 'Name have to be at least 3 char long!',
      );
    }
    try {
      if (_newImagePath != null) {
        await GetIt.I<ImageRepository>()
            .putAvatar(
              userId: GetIt.I<AuthRepository>().myId!,
              image: await File(_newImagePath!).readAsBytes(),
            )
            .firstWhere((e) => e.isFinished);
      }
    } catch (e) {
      await ErrorDialog.show(context: context, error: e);
    }
    final response = await GetIt.I<Client>()
        .request(GUpdateUserReq(
          (b) => b.vars
            ..id = GetIt.I<AuthRepository>().myId
            ..title = _title ?? profile.title
            ..description = _description ?? profile.description
            ..has_picture = _newImagePath != null || profile.has_picture,
        ))
        .firstWhere((e) => e.dataSource != DataSource.Optimistic);
    if (response.hasErrors && mounted) {
      await ErrorDialog.show(
        context: context,
        error: response.linkException ?? response.graphqlErrors,
      );
    }
    if (mounted) context.pop();
  }
}
