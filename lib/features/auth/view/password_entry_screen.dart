import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinterestclone/features/auth/providers/auth_provider.dart';

class PasswordEntryScreen extends StatefulWidget {
  const PasswordEntryScreen({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  State<PasswordEntryScreen> createState() => _PasswordEntryScreenState();
}

class _PasswordEntryScreenState extends State<PasswordEntryScreen> {
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Create Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          TextField(
            controller: textcontroller,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer(builder: (context, ref, _) {
              return ElevatedButton(
                onPressed: () {
                  widget.controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                  ref
                      .read(authProvider.notifier)
                      .setPassword(textcontroller.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      textcontroller.text != "" ? Colors.red : Colors.grey,
                ),
                child: Text("Continue"),
              );
            }),
          )
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
    );
  }
}
