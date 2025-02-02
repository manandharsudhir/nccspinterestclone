import 'package:flutter/material.dart';

import 'interest_selection_screen.dart';
import 'name_entry_screen.dart';
import 'password_entry_screen.dart';

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
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          PasswordEntryScreen(controller: controller),
          InterestSelectionScreen(),
          NameEntryScreen(
            pageController: controller,
          ),
          Container(
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
