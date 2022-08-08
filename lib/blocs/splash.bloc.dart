import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashBloc extends ChangeNotifier {
  navigateAfterStart() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.toNamed('/onboarding/intro');
  }
}
