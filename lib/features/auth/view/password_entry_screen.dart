import 'package:flutter/material.dart';

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
      // child: Column(
      //   children: [
      //     Text(
      //       "Create Password",
      //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      //     ),
      //     TextField(
      //       controller: textcontroller,
      //     ),
      //     Spacer(),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: ElevatedButton(
      //         onPressed: () {
      //           widget.controller.nextPage(
      //               duration: Duration(milliseconds: 200),
      //               curve: Curves.bounceIn);
      //         },
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor:
      //               textcontroller.text != "" ? Colors.red : Colors.grey,
      //         ),
      //         child: Text("Continue"),
      //       ),
      //     )
      //     // Row(
      //     //   children: [
      //     //     IconButton(
      //     //       onPressed: () {},
      //     //       icon: Icon(Icons.chevron_left),
      //     //     ),
      //     //   ],
      //     // )
      //   ],
      // ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
