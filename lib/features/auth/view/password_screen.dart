import 'package:flutter/material.dart';
import 'package:pinterestclone/features/auth/view/birthdate_screen.dart';

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

  String? name;

  void setName(String enteredName) {
    setState(() {
      name = enteredName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            6,
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
          PasswordEntryScreen(
            controller: controller,
          ),
          NameEntryScreen(
            controller: controller,
            nameSetter: setName,
          ),
          BirthdateScreen(
            controller: controller,
            name: name ?? "",
          ),
          Container(),
          Container(),
          Container()
        ],
      ),
    );
  }
}
