import 'package:flutter/material.dart';
import 'package:koo_app/base_screen.dart';
import 'package:koo_app/theme.dart';

void main() {
  runApp(
    MyApp(
      appTheme: AppTheme(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appTheme,
  });

  final AppTheme appTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koo App',
      theme: appTheme.lightBase,
      darkTheme: appTheme.darkBase,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: const BaseScreen(),
    );
  }
}
