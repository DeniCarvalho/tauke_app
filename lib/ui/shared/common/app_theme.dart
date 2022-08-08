import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'responsive/responsive.dart';

class AppThemeData {
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: AppColors.transparent,
    elevation: 0,
    toolbarHeight: 0,
  );

  static const fontFamily = 'Rubik';

  static ThemeData light = ThemeData(
    platform: TargetPlatform.iOS,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomAppBarColor: AppColorsDark.backgroundColor,
    cardColor: AppColors.backgroundColor,
    textTheme: const TextTheme().copyWith(
      headline1: TextStyle(
        color: AppColors.secondary,
        fontSize: 22.fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
    ),
    
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      background: AppColors.backgroundColor,
      surface: AppColors.system,
      inverseSurface: AppColors.systemInverse,
    ),
    appBarTheme: const AppBarTheme().copyWith(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.backgroundColor,
    ),
    iconTheme: const IconThemeData().copyWith(
      color: AppColors.system,
    ),
  );

  static ThemeData dark = ThemeData(
    platform: TargetPlatform.iOS,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    backgroundColor: AppColorsDark.backgroundColor,
    scaffoldBackgroundColor: AppColorsDark.backgroundColor,
    bottomAppBarColor: AppColorsDark.backgroundColor,
    cardColor: AppColorsDark.backgroundColor,
    textTheme: const TextTheme().copyWith(
      headline1: TextStyle(
        color: AppColors.secondary,
        fontSize: 22.fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColorsDark.primary,
      secondary: AppColorsDark.secondary,
      tertiary: AppColorsDark.tertiary,
      background: AppColorsDark.backgroundColor,
      surface: AppColorsDark.system,
      inverseSurface: AppColors.tertiary,
    ),
    appBarTheme: const AppBarTheme().copyWith(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: AppColorsDark.backgroundColor,
    ),
    iconTheme: const IconThemeData().copyWith(
      color: AppColorsDark.system,
    ),
  );
}
