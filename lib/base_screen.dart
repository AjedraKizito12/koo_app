import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:koo_app/models/model_theme.dart';
import 'package:koo_app/theme/theme.dart';
import 'package:provider/provider.dart';

import 'screens/EntertainmentScreen.dart';
import 'screens/MyProfileScreen.dart';
import 'screens/NotificationScreen.dart';
import 'screens/SearchScreen.dart';

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
      child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider themeNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF7FFF0),
          key: _scaffoldKey,
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            onTap: onTapped,
            selectedItemColor: const Color(0xFFE69C1C),
            unselectedItemColor: Colors.black54,
            currentIndex: _currentIndex,
            iconSize: 30,
            enableFeedback: false,
            items: const [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Ionicons.film_outline,
                  ),
                  icon: Icon(
                    Ionicons.film_outline,
                  ),
                  label: 'Entertainment'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_off),
                  activeIcon: Icon(Icons.search),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Ionicons.notifications_outline,
                  ),
                  activeIcon: Icon(
                    Ionicons.notifications_outline,
                  ),
                  label: 'Notifications'),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Ionicons.person_outline,
                ),
                icon: Icon(
                  Ionicons.person_outline,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      }),
    );
  }
}
