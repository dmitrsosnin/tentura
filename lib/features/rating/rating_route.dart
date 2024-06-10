import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/data/service/remote_api_service.dart';

import 'data/rating_repository.dart';
import 'ui/bloc/rating_cubit.dart';
import 'ui/screen/rating_screen.dart';

GoRoute buildRatingRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
    GoRoute(
      path: pathRating,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) {
        final remoteApiService = context.read<RemoteApiService>();
        return BlocProvider(
          create: (context) => RatingCubit(
            hasTokenChanges: remoteApiService.hasTokenChanges,
            ratingRepository: RatingRepository(remoteApiService),
          ),
          child: const RatingScreen(),
        );
      },
    );
