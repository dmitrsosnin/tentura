import 'package:flutter/widgets.dart';

export 'package:go_router/go_router.dart';

const pathLogin = '/login';

const pathHomeField = '/field';
const pathHomeUpdates = '/updates';
const pathHomeProfile = '/profile';

const pathGraph = '/graph';
const pathRating = '/rating';

const pathProfileView = '/profile/view';
const pathProfileEdit = '/profile/edit';

const pathBeaconView = '/beacon/view';
const pathBeaconCreate = '/beacon/create';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
