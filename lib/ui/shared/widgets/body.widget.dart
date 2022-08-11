import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tauke_app/ui/shared/shared.dart';

import '../../../blocs/blocs.dart';

class BodyAdaptive extends StatelessWidget {
  final Widget child;
  final double paddingTop;
  const BodyAdaptive({
    Key? key,
    required this.child,
    this.paddingTop = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool iphonex = MediaQuery.of(context).size.height >= 812.0;
    final double bottomPadding = iphonex ? 16.0 : 0.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: Provider.of<ThemeBloc>(context).isDark()
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
        ),
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            top: paddingTop.responsiveHeight,
            bottom: bottomPadding + 10,
            left: 20.responsiveWidth,
            right: 20.responsiveWidth,
          ),
          child: child,
        ),
      ),
    );
  }
}
