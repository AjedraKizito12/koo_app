import 'package:flutter/material.dart';
import 'package:koo_app/base_screen.dart';
import 'package:koo_app/models/model_theme.dart';
import 'package:koo_app/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(appTheme: AppTheme()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appTheme});

  final AppTheme appTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp(
            title: 'Koo App',
            theme: themeNotifier.isDark
                ? ThemeData(
                    brightness: Brightness.dark,
                  )
                : ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Colors.yellow,
                    primarySwatch: Colors.yellow,
                  ),
            debugShowCheckedModeBanner: false,
            home: const BaseScreen(),
          );
        },
      ),
    );
  }
}
