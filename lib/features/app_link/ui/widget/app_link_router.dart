import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import '../../app_link_route.dart';

class AppLinkRouter extends StatefulWidget {
  const AppLinkRouter({
    required this.router,
    required this.child,
    super.key,
  });

  final GoRouter router;
  final Widget child;

  @override
  State<AppLinkRouter> createState() => _AppLinkRouterState();
}

class _AppLinkRouterState extends State<AppLinkRouter>
    with WidgetsBindingObserver {
  static WidgetsBinding get _binding => WidgetsBinding.instance;

  String _currentPath = '';

  @override
  void initState() {
    _binding.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    _binding.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    if (routeInformation.uri.path == pathAppLinkView) {
      _currentPath = replaceAppLinkPath(routeInformation.uri);
      widget.router.push(_currentPath);
      return SynchronousFuture(true);
    }
    _currentPath = routeInformation.uri.path;
    return SynchronousFuture(false);
  }

  @override
  Future<bool> didPopRoute() {
    // Back
    if (widget.router.canPop()) return SynchronousFuture(false);

    // Exit if Home
    if (_currentPath.startsWith('/home/')) return SynchronousFuture(false);

    // Back to Home
    widget.router.go(pathHomeConnect);
    return SynchronousFuture(true);
  }
}
