import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../../blocs/blocs.dart';
import '../../shared/shared.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigateAfterStart();
  }

  navigateAfterStart() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed('/onboarding/intro');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Provider.of<ThemeBloc>(context).isDark()
          ? Theme.of(context).backgroundColor
          : Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 150.responsiveHeight,
          child: RiveAnimation.asset(
            Provider.of<ThemeBloc>(context).isDark()
                ? AppAnimations.logoDark
                : AppAnimations.logoLight,
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
