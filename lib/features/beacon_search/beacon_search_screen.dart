import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/features/beacon_details/beacon_details_screen.dart';

import 'beacon_search_cubit.dart';

class BeaconSearchScreen extends StatelessWidget {
  const BeaconSearchScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => BeaconSearchCubit(),
        child: BlocBuilder<BeaconSearchCubit, BeaconSearchState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a Code',
                  suffixIcon: state.isLoading
                      ? Transform.scale(
                          scale: 0.5,
                          child: const CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.search_rounded),
                ),
                onChanged: context.read<BeaconSearchCubit>().searchBeaconById,
              ),
            ),
            body: ListView(
              children: [
                for (final e in state.beacons)
                  ListTile(
                    leading: AvatarImage(
                      hasImage: e.author.hasPicture,
                      userId: e.author.id,
                      height: 40,
                      width: 40,
                    ),
                    title: Text(e.title),
                    subtitle: Text(
                      e.description,
                      maxLines: 1,
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => BeaconDetailsScreen(beacon: e),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
