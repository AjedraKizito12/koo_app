import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 200,
      child: Column(
        children: [
          const Text("Feed Selection"),
          bottomSheetOptions(
            title: "Home",
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
          bottomSheetOptions(
            title: "News",
            icon: const Icon(Icons.newspaper),
            onPressed: () {},
          ),
          bottomSheetOptions(
            title: "Sports",
            icon: const Icon(Icons.sports_football),
            onPressed: () {},
          ),
          bottomSheetOptions(
            title: "Entertainment",
            icon: const Icon(Icons.video_file),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget bottomSheetOptions(
      {required String title,
      required Icon icon,
      required Function() onPressed}) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onPressed,
    );
  }
}
