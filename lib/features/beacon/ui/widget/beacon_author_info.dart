import 'package:flutter/material.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/avatar_image.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/context/ui/bloc/context_cubit.dart';
import 'package:tentura/features/profile/domain/entity/profile.dart';

class BeaconAuthorInfo extends StatelessWidget {
  const BeaconAuthorInfo({
    required this.author,
    required this.textTheme,
    required this.beacon,
    super.key,
  });

  final Profile author;
  final TextTheme textTheme;
  final Beacon beacon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar
        GestureDetector(
          onTap: () => context.pushRoute(
            ProfileViewRoute(id: author.id),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: kSpacingSmall),
            child: AvatarImage(
              userId: author.imageId,
              size: 40,
            ),
          ),
        ),
        // User displayName
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => context.pushRoute(
                ProfileViewRoute(id: author.id),
              ),
              child: Text(
                author.title,
                style: textTheme.headlineMedium,
              ),
            ),
            if (beacon.context.isNotEmpty)
              TextButton(
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: WidgetStatePropertyAll<Size>(Size.zero),
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'in the ',
                      style: textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: '#${beacon.context} ',
                      style: textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    TextSpan(
                      text: 'topic',
                      style: textTheme.bodySmall,
                    ),
                  ]),
                ),
                onPressed: () async {
                  await GetIt.I<ContextCubit>().add(
                    contextName: beacon.context,
                    select: false,
                  );
                  if (context.mounted) {
                    showSnackBar(
                      context,
                      text: 'Topic ${beacon.context} has been added.',
                    );
                  }
                },
              ),
          ],
        ),
      ],
    );
  }
}
