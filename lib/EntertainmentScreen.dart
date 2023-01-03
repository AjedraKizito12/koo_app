import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

class EntertainmentScreen extends StatefulWidget {
  const EntertainmentScreen({Key? key}) : super(key: key);

  @override
  State<EntertainmentScreen> createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen> {
  bool hasImage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Koo"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: const [
                  Text("Welcome to Entertainment"),
                  Text("Here you can view all the entertaining Koos"),
                ],
              ),
              const SizedBox(height: 20),
              chat(
                userName: 'Kanconst agana Ranaut',
                tagName: '@kanconstaganaranaut',
                message:
                    'Do you know Raj Kapoor ji and Dilip Kumar ji were best friends? \nLast of that generation Super stars is also gone …. \nRIP Dilip Kumar ji 🙏 ',
                imgSrc: 'assets/images/img.png',
                userImage: '',
              ),
              const SizedBox(height: 10),
              chat(
                  userName: 'Mrunal Thakur',
                  tagName: '@roykapurfilms',
                  message:
                      'Happiest Birthday to the real Chief of our Pippa Family! \nCant wait to begin!',
                  imgSrc: '',
                  userImage: ''),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (BuildContext context) {
            return const BottomSheetScreen();
          },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)
              ),
            ),
          );
        },
        tooltip: 'bottomSheet',
        child: const Icon(Icons.add),
      ),
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ImageIcon(NetworkImage("", ),size: 30,),
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
            const Text("20h ago"),
          ],
        ),
        const SizedBox(height: 10),
        Text(message),
        const SizedBox(height: 10),
        Column(
          children: [
            imgSrc.length > 1
                ? Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(imgSrc),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                        scale: .8,
                      ),
                      // image: DecorationImage(
                      //
                      //   image: NetworkImage(image),
                      // ),
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
          foregroundColor: Colors.grey,
        ),
        onPressed: onPressed,
        icon: icon,
        label: Text(label));
  }
}
