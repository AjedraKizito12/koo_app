import 'package:flutter/material.dart';
import 'package:koo_app/utils/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;

  ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.amberAccent,
    appBarTheme: const AppBarTheme(
      iconTheme: const IconThemeData(color: AppColors.primaryBlack),
      elevation: 0,
      backgroundColor: AppColors.scaffoldBackgroundLight,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryYellow),
    iconTheme: const IconThemeData(color: AppColors.primaryYellow),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black87,
      ),
    ),
  );

  ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.shade3),
      backgroundColor: AppColors.primaryBlack,
      elevation: 0,
      foregroundColor: AppColors.primaryBlack,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
    primaryColor: AppColors.primaryBlack,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryYellow),
    iconTheme: const IconThemeData(color: AppColors.primaryYellow),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  ThemeProvider({required bool isDarkMode}) {
    _selectedTheme = isDarkMode ? dark : light;
  }
  void swapTheme() {
    _selectedTheme = _selectedTheme == dark ? light : dark;
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}
