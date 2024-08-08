import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

class PlatformRoutePushObserver extends StatefulWidget {
  const PlatformRoutePushObserver({
    required this.router,
    this.child,
    super.key,
  });

  final GoRouter router;
  final Widget? child;

  @override
  State<PlatformRoutePushObserver> createState() =>
      _PlatformRoutePushObserverState();
}

class _PlatformRoutePushObserverState extends State<PlatformRoutePushObserver>
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
  Widget build(BuildContext context) => widget.child ?? const SizedBox.shrink();

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    if (routeInformation.uri.path == pathAppLinkView) {
      widget.router.pushNamed(
        'appLink',
        queryParameters: routeInformation.uri.queryParametersAll,
      );
      return SynchronousFuture(true);
    }
    return SynchronousFuture(false);
  }
}
