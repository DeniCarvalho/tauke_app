import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'core/app_main.dart';
import 'core/firebase/firebase.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await RemoteConfigCustom().initialize();

  await MessagingCustom().initialize();
  await MessagingCustom().getTokenFirebase();

  HttpOverrides.global = MyHttpOverrides();
  Paint.enableDithering = true;
  if (!kIsWeb) {
    Intl.defaultLocale = Platform.localeName;
    // Intl.defaultLocale = 'pt_BR';
  }
  await runBaseApp();
}
