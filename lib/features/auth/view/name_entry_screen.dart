import 'package:flutter/material.dart';

class NameEntryScreen extends StatefulWidget {
  const NameEntryScreen({
    super.key,
    required this.controller,
    required this.nameSetter,
  });

  final PageController controller;
  final Function(String) nameSetter;

  @override
  State<NameEntryScreen> createState() => _NameEntryScreenState();
}

class _NameEntryScreenState extends State<NameEntryScreen> {
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "What's your name?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          TextField(
            controller: textcontroller,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                widget.controller.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn);

                widget.nameSetter(textcontroller.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    textcontroller.text != "" ? Colors.red : Colors.grey,
              ),
              child: Text("Continue"),
            ),
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
