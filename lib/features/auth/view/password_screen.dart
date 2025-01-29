import 'dart:developer';

import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex > index
                    ? Colors.grey
                    : currentIndex == index
                        ? Colors.white
                        : Colors.grey[300],
                border: currentIndex == index
                    ? Border.all(
                        color: Colors.black,
                        width: 5,
                      )
                    : null,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            controller.jumpToPage(3);
          },
          child: Text("Continue"),
        ),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Create Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                TextField(),

                // Row(
                //   children: [
                //     IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.chevron_left),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Create Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                TextField(),

                // Row(
                //   children: [
                //     IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.chevron_left),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
