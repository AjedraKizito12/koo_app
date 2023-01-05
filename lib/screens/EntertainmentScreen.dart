import 'package:flutter/material.dart';
import 'package:koo_app/screens/create_koo.dart';
import 'package:koo_app/models/model_theme.dart';
import 'package:provider/provider.dart';

import '../utils/bottom_sheet.dart';

class EntertainmentScreen extends StatefulWidget {
  const EntertainmentScreen({Key? key}) : super(key: key);

  @override
  State<EntertainmentScreen> createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen> {
  bool hasImage = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Koo",
                  style: TextStyle(),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateKoo(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.message,
                  ),
                )
              ],
            ),
            actions: [
              IconButton(
                  icon: Icon(themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny),
                  onPressed: () {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  })
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: const [
                      Text(
                        "Welcome to Entertainment",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Here you can view all the entertaining Koos",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  chat(
                    userName: 'Kanconst agana Ranaut',
                    tagName: '@kanconstaganaranaut',
                    message:
                        'Do you know Raj Kapoor ji and Dilip Kumar ji were best friends? \nLast of that generation Super stars is also gone …. \nRIP Dilip Kumar ji 🙏 ',
                    imgSrc: 'assets/images/img.png',
                    userImage: 'assets/images/profile1.png',
                  ),
                  const SizedBox(height: 10),
                  chat(
                      userName: 'Mrunal Thakur',
                      tagName: '@roykapurfilms',
                      message:
                          'Happiest Birthday to the real Chief of our Pippa Family! \nCant wait to begin!',
                      imgSrc: '',
                      userImage: 'assets/images/profile2.png'),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const BottomSheetScreen();
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
              );
            },
            tooltip: 'bottomSheet',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget chat({
    required String message,
    required String imgSrc,
    required String userName,
    required String tagName,
    required String userImage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: ImageIcon(AssetImage(userImage)),
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    Text(userName),
                    Text(
                      tagName,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              "20h ago",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          message,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            imgSrc.length > 1
                ? Container(
                    height: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgSrc),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                        scale: .8,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                : Container(),
            Wrap(
              spacing: 20,
              children: [
                interactions(
                  label: '200',
                  icon: const Icon(Icons.share),
                  onPressed: () {},
                ),
                interactions(
                  label: '200',
                  icon: const Icon(Icons.message),
                  onPressed: () {},
                ),
                interactions(
                  label: '200',
                  icon: const Icon(Icons.heart_broken),
                  onPressed: () {},
                ),
                interactions(
                  label: '200',
                  icon: const Icon(Icons.link),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
        const Divider(
          thickness: 2,
          height: 20,
        ),
      ],
    );
  }

  Widget interactions({
    required String label,
    required Icon icon,
    required Function() onPressed,
  }) {
    return TextButton.icon(
      style: TextButton.styleFrom(
          // foregroundColor: const Color(0xFF282C3F),
          ),
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
    );
  }
}
