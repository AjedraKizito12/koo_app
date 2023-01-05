import 'package:flutter/material.dart';
import 'package:koo_app/utils/theme.dart';

class CreateKoo extends StatefulWidget {
  const CreateKoo({Key? key}) : super(key: key);

  @override
  State<CreateKoo> createState() => _CreateKooState();
}

class _CreateKooState extends State<CreateKoo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      child: const Text("Post Koo"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("Category"),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.person,
                          size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration.collapsed(
                            hintText: "Share your thoughts with the world..",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 2),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: _offsetPopup(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Row(
        children: const [
          Text("Sharing with "),
          Text(
            "Everyone on Koo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.arrow_upward,
            size: 15,
            color: AppColors.primaryYellow,
          )
        ],
      ),
    );
  }

  Widget _offsetPopup() => PopupMenuButton<int>(
        offset: const Offset(0, -290),
        elevation: 0,
        // position: PopupMenuPosition.values,

        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: _popUpMenuItems(
              title: "Location",
              icon: const Icon(
                Icons.location_on,
                size: 35,
                color: AppColors.primaryYellow,
              ),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: _popUpMenuItems(
              title: "Polls",
              icon: const Icon(
                Icons.poll,
                size: 35,
                color: AppColors.primaryYellow,
              ),
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: _popUpMenuItems(
              title: "GIF",
              icon: const Icon(
                Icons.gif,
                size: 35,
                color: AppColors.primaryYellow,
              ),
            ),
          ),
          PopupMenuItem(
            value: 4,
            child: _popUpMenuItems(
              title: "Photos/Videos",
              icon: const Icon(
                size: 35,
                Icons.photo,
                color: AppColors.primaryYellow,
              ),
            ),
          ),
        ],
        icon: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const ShapeDecoration(
            color: AppColors.primaryYellow,
            shape: StadiumBorder(
              side: BorderSide(color: Colors.white, width: 2),
            ),
          ),
          child: const Icon(
            Icons.attach_file,
            color: Colors.white,
          ),
        ),
      );

  Widget _popUpMenuItems({
    required String title,
    required Icon icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 5,
                  offset: const Offset(0, 5), // Shadow position
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.shade3,
              foregroundColor: AppColors.primaryYellow,
              child: icon,
            ),
          )
        ],
      ),
    );
  }
}
