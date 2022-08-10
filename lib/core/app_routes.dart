import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../ui/pages/pages.dart';
import '../ui/shared/shared.dart';

class AppRoutes {
  static GetPage splash = GetPage(
    name: '/splash',
    page: () => const SplashPage(),
    customTransition: SharedAxisTransitions(
      type: SharedAxisTransitionType.scaled,
    ),
  );

  static GetPage onboardingIntro = GetPage(
    name: '/onboarding/intro',
    page: () => const OnboardingIntroPage(),
    customTransition: SharedAxisTransitions(
      type: SharedAxisTransitionType.scaled,
    ),
  );
  static GetPage onboardingPhone = GetPage(
    name: '/onboarding/phone',
    page: () => const OnboardingPhonePage(),
    customTransition: SharedAxisTransitions(
      type: SharedAxisTransitionType.horizontal,
    ),
  );

  final List<GetPage> routes = [splash, onboardingIntro, onboardingPhone];
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
