import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BeaconTile extends StatelessWidget {
  final String userId, displayName, avatarUrl, title, description, imagePath;

  const BeaconTile({
    super.key,
    required this.userId,
    required this.displayName,
    required this.avatarUrl,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: avatarUrl.isEmpty
                ? const CircleAvatar(
                    radius: 20,
                    child: CircularProgressIndicator.adaptive(),
                  )
                : CircleAvatar(
                    radius: 20,
                    backgroundImage: CachedNetworkImageProvider(avatarUrl),
                  ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // User displayName
              Text(
                displayName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              // Beacon Image
              Container(
                constraints: const BoxConstraints(
                  minHeight: 200,
                  maxHeight: 300,
                  minWidth: 400,
                  maxWidth: 600,
                ),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: imagePath.isEmpty
                      ? Border.all(
                          color: Colors.black12,
                          width: 1,
                        )
                      : null,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: imagePath.isEmpty
                    ? const Icon(Icons.photo, size: 100)
                    : Image.file(
                        File(imagePath),
                        fit: BoxFit.cover,
                      ),
              ),
              // Beacon Title
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              // Beacon Description
              Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      );
}
