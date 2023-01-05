import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:koo_app/screens/EntertainmentScreen.dart';
import 'package:koo_app/feeds/home.dart';
import 'package:koo_app/feeds/news.dart';
import 'package:koo_app/feeds/sports.dart';
import 'package:koo_app/utils/theme.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  final List _activities = ["Home", "News", "Sports", "Entertainment"];
  final List _icons = [
    const Icon(
      Ionicons.home_outline,
    ),
    const Icon(
      Ionicons.newspaper_outline,
    ),
    const Icon(
      Ionicons.tennisball_outline,
    ),
    const Icon(Icons.sports_football),
  ];

  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 384,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Feed Selection",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Column(
            children: List.generate(
              _activities.length,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        currentIndex == index ? const Color(0xFFFFF0C0) : null,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 56,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: AppColors.shade3,
                      radius: 20,
                      child: _icons[index],
                    ),
                    title: Text(
                      _activities[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      setState(() {
                        currentIndex = index;

                        if (_activities[index] == "Home") {
                          Future.delayed(
                            const Duration(seconds: 1),
                            () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                )),
                          );

                          // Navigator.pop(context);
                        } else if (_activities[index] == "News") {
                          Future.delayed(
                            const Duration(seconds: 1),
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewsScreen(),
                              ),
                            ),
                          );
                        } else if (_activities[index] == "Sports") {
                          Future.delayed(
                            const Duration(seconds: 1),
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SportsScreen(),
                              ),
                            ),
                          );
                        } else if (_activities[index] == "Entertainment") {
                          Future.delayed(const Duration(seconds: 1),
                              () => Navigator.pop(context));
                        }
                      });
                    },
                    trailing: currentIndex == index
                        ? const CircleAvatar(
                            backgroundColor: AppColors.success1,
                            foregroundColor: AppColors.shade3,
                            radius: 15,
                            child: Icon(
                              Icons.check,
                              size: 15,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSheetOptions({
    required String title,
    required Icon icon,
    required Function() onPressed,
  }) {
    return Column(
      children: List.generate(
        _activities.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0C0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 56,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.shade3,
                radius: 20,
                child: icon,
              ),
              title: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: onPressed,
              trailing: const CircleAvatar(
                backgroundColor: AppColors.success1,
                foregroundColor: AppColors.shade3,
                radius: 15,
                child: Icon(
                  Icons.check,
                  size: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
