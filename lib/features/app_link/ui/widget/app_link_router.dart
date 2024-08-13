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
      widget.router.push(replaceAppLinkPath(routeInformation.uri));
      return SynchronousFuture(true);
    }
    return SynchronousFuture(false);
  }
}
