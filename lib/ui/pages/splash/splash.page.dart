import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tauke_app/models/user.model.dart';
import '../../../blocs/blocs.dart';
import '../../../settings.dart';
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
    try {
      final prefs = await SharedPreferences.getInstance();
      String? userData = prefs.getString(Settings.dataUserLocalName);

      if (userData != null) {
        final user = UserModel.fromJson(json.decode(userData));
        Settings.user = user;
      } else {
        String? deviceId = await PlatformDeviceId.getDeviceId;
        final user = UserModel(id: deviceId ?? '', phone: '', name: '');
        await prefs.setString(Settings.dataUserLocalName, json.encode(user));
        Settings.user = user;
      }
      Get.offNamed('/onboarding/intro');
    } catch (e) {
      Get.snackbar(
        'Erro interno',
        'Ocorreu um erro ao iniciar o aplicativo. Contate o suporte.',
        duration: const Duration(seconds: 5),
        colorText: Get.isDarkMode ? Colors.white : Colors.black,
        icon: const Icon(
          Icons.error,
          color: AppColors.danger,
          size: 30,
        ),
      );
    }
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
