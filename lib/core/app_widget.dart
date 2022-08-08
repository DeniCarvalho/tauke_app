import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../blocs/blocs.dart';
import '../ui/shared/shared.dart';
import 'app_routes.dart';
import 'internationalization/app_localizations.dart';

class AppWidget extends StatefulWidget {
  /// Creates a [AppWidget]
  const AppWidget({Key? key}) : super(key: key);
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColorsDark.backgroundColor,
        systemNavigationBarDividerColor: AppColorsDark.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.requestFocus(FocusNode());
        }
      },
      child: GetMaterialApp(
        title: "Tauke",
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.light,
        darkTheme: AppThemeData.dark,
        themeMode: Provider.of<ThemeBloc>(context).mode,
        initialRoute: AppRoutes.splash.path,
        routes: AppRoutes().mapRoutes(),
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('pt', 'BR'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
