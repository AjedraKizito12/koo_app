
import 'package:flutter/material.dart';

import 'EntertainmentScreen.dart';
import 'MyProfileScreen.dart';
import 'NotificationScreen.dart';
import 'SearchScreen.dart';


class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const EntertainmentScreen(),
    const SearchScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF7FFF0),
        key: _scaffoldKey,
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTapped,
          selectedItemColor: const Color(0xFFE69C1C),
          unselectedItemColor: Colors.black54,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.music_note),
                icon: Icon(Icons.music_off),
                label: 'Entertainment'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_off),
                activeIcon: Icon(Icons.search),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                activeIcon: Icon(Icons.notifications_active),
                label: 'Notif'),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_off),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
