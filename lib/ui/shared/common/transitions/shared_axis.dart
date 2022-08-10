import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/theme.bloc.dart';
import '../common.dart';

class SharedAxisTransitions extends CustomTransition {
  final SharedAxisTransitionType type;

  SharedAxisTransitions({
    this.type = SharedAxisTransitionType.horizontal,
  });

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
      child: SharedAxisTransition(
        fillColor: !Provider.of<ThemeBloc>(context).isDark()
            ? AppColorsDark.secondary
            : AppColors.secondary,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: type,
        child: child,
      ),
    );
  }
}
