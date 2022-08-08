import 'package:flutter/widgets.dart';

import '../ui/pages/pages.dart';

class AppRoutes {
  static Router splash = Router(
    path: '/splash',
    page: (context) => const SplashPage(),
  );
  static Router onboarding = Router(
    path: '/onboarding',
    children: [
      Router(
        path: '/intro',
        page: (context) => const OnboardingIntroPage(),
      )
    ],
  );

  final List<Router> routes = [splash, onboarding];

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   splash.path: splash.page,
  // };

  Map<String, Widget Function(BuildContext)> mapRoutes() {
    late Map<String, Widget Function(BuildContext)> values = {};
    for (var i = 0; i < routes.length; i++) {
      final route = routes[i];
      if (route.page != null) {
        values[route.path] = route.page!;
      } else if (route.children != null && route.children!.isNotEmpty) {
        for (var c = 0; c < route.children!.length; c++) {
          final child = route.children![c];
          if (child.page != null) {
            values['${route.path}${child.path}'] = child.page!;
          }
        }
      }
    }
    return values;
  }
}

class Router {
  final String path;
  final Widget Function(BuildContext)? page;
  final List<Router>? children;

  Router({
    required this.path,
    this.page,
    this.children,
  });
}
