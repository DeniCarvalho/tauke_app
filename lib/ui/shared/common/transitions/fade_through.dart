import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/blocs.dart';
import '../common.dart';

class FadeThroughTransitions extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      alignment: Alignment.center,
      child: FadeThroughTransition(
        fillColor: !Provider.of<ThemeBloc>(context).isDark()
            ? AppColorsDark.secondary
            : AppColors.secondary,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      ),
    );
  }
}
