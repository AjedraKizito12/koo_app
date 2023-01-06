import 'package:flutter/material.dart';
import 'package:koo_app/base_screen.dart';
import 'package:koo_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => ThemeProvider(isDarkMode: false),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, ThemeProvider themeNotifier, child) {
        return MaterialApp(
          title: 'Koo App',
          theme: themeNotifier.getTheme,
          debugShowCheckedModeBanner: false,
          home: const BaseScreen(),
        );
      },
    );
  }
}
