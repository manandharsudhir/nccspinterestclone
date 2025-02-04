import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdateScreen extends StatefulWidget {
  const BirthdateScreen({
    super.key,
    required this.controller,
    required this.name,
  });

  final PageController controller;
  final String name;

  @override
  State<BirthdateScreen> createState() => _BirthdateScreenState();
}

class _BirthdateScreenState extends State<BirthdateScreen> {
  TextEditingController textcontroller = TextEditingController();

  DateTime dateOfBirth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "hello ${widget.name}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          GestureDetector(
            onTap: () async {
              final pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1995),
                  lastDate: DateTime.now());
              if (pickedDate != null) {
                setState(() {
                  dateOfBirth = pickedDate;
                });
              }
            },
            child: Text(
              DateFormat.yMd().format(dateOfBirth),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                widget.controller.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn);
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
