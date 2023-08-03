import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _children = [
    const EntertainmentScreen(),
    const SearchScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
          body: PageView.builder(
            itemBuilder: (context, index) {
              return _children[_currentIndex];
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _pageController,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
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
