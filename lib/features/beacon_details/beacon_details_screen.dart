import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/entity/beacon.dart';
import 'package:gravity/ui/widget/beacon_image.dart';
import 'package:gravity/ui/widget/avatar_image.dart';

import 'beacon_details_cubit.dart';

class BeaconDetailsScreen extends StatelessWidget {
  final Beacon beacon;

  const BeaconDetailsScreen({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => BeaconDetailsCubit(beacon: beacon),
        child: BlocBuilder<BeaconDetailsCubit, BeaconDetailsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Beacon'),
                bottom: const PreferredSize(
                  preferredSize: Size(double.infinity, 1),
                  child: Divider(),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                    ),
                  )
                ],
              ),
              body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // User row (Avatar and Name)
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: AvatarImage(user: beacon.author),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          beacon.author.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const Icon(Icons.visibility_off_outlined),
                    ],
                  ),
                  // Image of Beacon
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: BeaconImage(beacon: beacon),
                  ),
                  // Title
                  Text(
                    beacon.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  // Description
                  Text(
                    beacon.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  // Date
                  Text(
                    beacon.createdAt.toString(),
                  ),
                  // Place
                  if (beacon.coordinates != null)
                    Text(
                      beacon.coordinates!.toSexagesimal(),
                    ),
                  const Divider(),
                  // Likes
                  const Placeholder(
                    color: Colors.black12,
                    fallbackHeight: 40,
                    child: Text('Like/Dislike, some counter'),
                  ),
                  const Divider(),
                  // Comments
                  ExpansionPanelList(
                    children: [
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) =>
                            const Text('2 new comments'),
                        body: const Text('Some comment'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
}
