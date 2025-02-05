import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinterestclone/features/auth/providers/auth_provider.dart';

class BirthdateScreen extends ConsumerStatefulWidget {
  const BirthdateScreen({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  ConsumerState<BirthdateScreen> createState() => _BirthdateScreenState();
}

class _BirthdateScreenState extends ConsumerState<BirthdateScreen> {
  TextEditingController textcontroller = TextEditingController();

  DateTime dateOfBirth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "hello ${ref.read(authProvider).name}",
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
                ref.read(authProvider).setAge(dateOfBirth);
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
