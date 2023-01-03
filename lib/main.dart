import 'package:flutter/material.dart';
import 'package:koo_app/base_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BaseScreen(),
    );
  }
}


