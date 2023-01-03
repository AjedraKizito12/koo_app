import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntertainmentScreen extends StatefulWidget {
  const EntertainmentScreen({Key? key}) : super(key: key);

  @override
  State<EntertainmentScreen> createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("Entertainment landing screen"))
    );
  }
}
