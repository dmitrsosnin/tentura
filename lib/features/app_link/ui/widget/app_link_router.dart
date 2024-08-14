import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:share_handler/share_handler.dart';

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

  final _subscription = ShareHandlerPlatform.instance.sharedMediaStream.listen(
    (e) {
      if (kDebugMode) {
        print('Stream: ${e.content}');
        // ignore: avoid_print
        e.attachments?.forEach(print);
      }
    },
  );

  @override
  void initState() {
    _binding.addObserver(this);
    ShareHandlerPlatform.instance.getInitialSharedMedia().then(
      (e) {
        if (e != null) {
          if (kDebugMode) {
            print('Initial Future: ${e.content}');
            // ignore: avoid_print
            e.attachments?.forEach(print);
          }
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _binding.removeObserver(this);
    _subscription.cancel();
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
