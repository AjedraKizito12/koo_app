import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateKoo extends StatefulWidget {
  const CreateKoo({super.key});

  @override
  State<CreateKoo> createState() => _CreateKooState();
}

class _CreateKooState extends State<CreateKoo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    child: const Text("Post Koo"),
                  )
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: const BoxDecoration(color: Color(0xFFF1F3F2)),
                  child: Row(
                    children: const [
                      Text("Category"),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Enter what you wanna post")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
