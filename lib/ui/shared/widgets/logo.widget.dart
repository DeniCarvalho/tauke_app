import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../blocs/theme.bloc.dart';
import '../shared.dart';

class Logo extends StatelessWidget {
  final double height;
  final double top;
  final bool isHero;
  final bool transitionOnUserGestures;
  final bool isIcon;
  final Color? color;
  final bool isSvg;
  final String? path;
  const Logo({
    Key? key,
    this.height = 50,
    this.top = 0,
    this.isHero = true,
    this.transitionOnUserGestures = true,
    this.isIcon = false,
    this.color,
    this.isSvg = false,
    this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image img = Image.asset(
      path ??
          (Provider.of<ThemeBloc>(context).isDark()
              ? (isIcon ? AppImages.iconDark : AppImages.logoDark)
              : (isIcon ? AppImages.iconLight : AppImages.logoLight)),
      fit: BoxFit.contain,
      gaplessPlayback: true,
      height: height.responsiveHeight,
    );
    return Container(
      padding: EdgeInsets.only(top: top.responsiveHeight),
      child: isHero
          ? Hero(
              tag: "logo",
              transitionOnUserGestures: transitionOnUserGestures,
              child: img,
            )
          : img,
    );
  }
}
