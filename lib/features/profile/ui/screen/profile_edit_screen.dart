import 'dart:io';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/dialog/error_dialog.dart';
import 'package:tentura/ui/widget/error_center_text.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/image/data/image_repository.dart';
import 'package:tentura/features/image/ui/widget/avatar_image.dart';

import '../../data/user_utils.dart';
import '../../data/gql/_g/user_update.req.gql.dart';
import '../../data/gql/_g/user_fetch_by_id.req.gql.dart';
import '../widget/avatar_positioned.dart';
import '../widget/gradient_stack.dart';

class ProfileEditScreen extends StatefulWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathProfileEdit,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const ProfileEditScreen(),
      );

  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late final _myId = context.read<AuthCubit>().state.currentAccount;

  String? _title;
  String? _description;
  String? _newImagePath;

  @override
  Widget build(BuildContext context) => Operation(
        client: GetIt.I<Client>(),
        operationRequest: GUserFetchByIdReq(
          (b) => b..vars.id = _myId,
        ),
        builder: (context, response, error) {
          final profile = response?.data?.user_by_pk;
          if (profile == null) {
            return response?.loading ?? false
                ? const Center(child: CircularProgressIndicator.adaptive())
                : ErrorCenterText(response: response, error: error);
          }
          final textTheme = Theme.of(context).textTheme;
          return Scaffold(
            appBar: AppBar(
              actions: [
                // Save Button
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton.outlined(
                    icon: const Icon(Icons.save),
                    onPressed: () => _onSavePressed(profile),
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                // Header
                GradientStack(
                  children: [
                    // Avatar
                    AvatarPositioned(
                      child: _newImagePath == null
                          ? AvatarImage(
                              size: AvatarPositioned.childSize,
                              userId: profile.imageId,
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

  Future<void> _onSavePressed(GUserFields profile) async {
    if (_title == null && _description == null && _newImagePath == null) {
      return context.pop();
    }
    if ((_title ?? profile.title).length < titleMinLength) {
      return showAdaptiveDialog<void>(
        context: context,
        builder: (_) => const ErrorDialog(
          error: 'Name have to be at least 3 char long!',
        ),
      );
    }
    try {
      if (_newImagePath != null) {
        await GetIt.I<ImageRepository>().putAvatar(
          userId: _myId,
          image: await File(_newImagePath!).readAsBytes(),
        );
      }
    } catch (e) {
      if (mounted) {
        await showAdaptiveDialog<void>(
          context: context,
          builder: (_) => ErrorDialog(error: e),
        );
      }
    }
    if (mounted) {
      final response = await doRequest(
        context: context,
        request: GUserUpdateReq(
          (b) => b.vars
            ..id = _myId
            ..title = _title ?? profile.title
            ..description = _description ?? profile.description
            ..has_picture = _newImagePath != null || profile.has_picture,
        ),
      );
      if (mounted && response.hasNoErrors) {
        context.canPop() ? context.pop() : context.go(pathHomeProfile);
      }
    }
  }
}
