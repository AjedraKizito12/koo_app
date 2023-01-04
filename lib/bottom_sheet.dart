import 'package:flutter/material.dart';
import 'package:koo_app/theme.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  final List _activities = ["Home", "News", "Sports", "Entertainment"];
  final List _icons = [
    const Icon(Icons.home),
    const Icon(Icons.newspaper),
    const Icon(Icons.sports_football),
    const Icon(Icons.video_file),
  ];
  final List _functions = [
    () {},
    () {},
    () {},
    () {},
  ];

  int currentIndex = 0;

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
          // bottomSheetOptions(
          //   title: "Home",
          //   icon: const Icon(Icons.home),
          //   onPressed: () {},
          // ),
          // bottomSheetOptions(
          //   title: "News",
          //   icon: const Icon(Icons.newspaper),
          //   onPressed: () {},
          // ),
          // bottomSheetOptions(
          //   title: "Sports",
          //   icon: const Icon(Icons.sports_football),
          //   onPressed: () {},
          // ),
          // bottomSheetOptions(
          //   title: "Entertainment",
          //   icon: const Icon(Icons.video_file),
          //   onPressed: () {},
          // ),
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
                    onTap: _functions[index],
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
