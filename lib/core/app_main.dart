import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../blocs/blocs.dart';
import '../settings.dart';
import 'app_widget.dart';
import 'firebase/remote_config/remote_config_custom.dart';

Future<void> runBaseApp() async {
  final prefs = await SharedPreferences.getInstance();
  final valueThemeLocalName = RemoteConfigCustom().getValueOrDefault(
    key: 'themeLocalName',
    defaultValue: Settings.themeLocalName,
  );
  String? modeSave = prefs.getString(valueThemeLocalName);
  
  ThemeMode mode = modeSave == 'dark'
      ? ThemeMode.dark
      : modeSave == 'light'
          ? ThemeMode.light
          : ThemeMode.system;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(mode: mode),
        ),
        ChangeNotifierProvider<SplashBloc>.value(
          value: SplashBloc(),
        ),
        ChangeNotifierProvider<OnboardingBloc>.value(
          value: OnboardingBloc(),
        ),
      ],
      child: const AppWidget(),
    ),
  );
}
