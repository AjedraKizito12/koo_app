import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const primaryblack = Color(0xFF161616);
  static const primaryYellow = Color(0xFFFFCB2C);
  static const secondary = Color(0xFFF49B15);
  static const text1 = Color(0xFF282C3F);
  static const text2 = Color(0xFF161616);
  static const textLigth = Color(0xFFF3F3F3);
  static const subText = Color(0xFFB6B6B6);
  static const success1 = Color(0xFF4BB543);
  static const success2 = Color(0xFF00BA88);
  static const error1 = Color(0xFFFF0000);
  static const error2 = Color(0xFFFA3C6A);
  static const diabled = Color(0xFFD3D3D3);
  static const icons = Color(0xFF5B7083);
  static const iconLight = Color(0xFFF3F3F3);
  static const shade1 = Color(0xFF161616);
  static const shade2 = Color(0xFFB6B6B6);
  static const shade3 = Color(0xFFF3F3F3);
  static const cardLight = Color(0xFFFFFFFF);
  static const cardDark = Color(0xFF000000);
}

abstract class _LightColors {
  static const background = Color(0xFFFFFFFF);
  // static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF000000);
  // static const card = AppColors.cardDark;
}

/// Reference to the application theme.
class AppTheme {
  static const accentColor = AppColors.primaryblack;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  /// Light theme and its settings.
  ThemeData get light => ThemeData(
        brightness: Brightness.light,
        colorScheme: lightBase.colorScheme.copyWith(secondary: accentColor),
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.text1),
        backgroundColor: _LightColors.background,
        appBarTheme: lightBase.appBarTheme.copyWith(
          iconTheme: lightBase.iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: AppColors.text1,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        scaffoldBackgroundColor: _LightColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
        ),
        // cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.text1),
        ),
        iconTheme: const IconThemeData(color: AppColors.icons),
      );

  /// Dark theme and its settings.
  ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        colorScheme: darkBase.colorScheme.copyWith(secondary: accentColor),
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textLigth),
        backgroundColor: _DarkColors.background,
        appBarTheme: darkBase.appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        scaffoldBackgroundColor: _DarkColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
        ),
        // cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLigth),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
      );
}
