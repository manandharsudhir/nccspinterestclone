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
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              "Create Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            TextFormField(
              controller: textcontroller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(obscureText
                      ? Icons.visibility_sharp
                      : Icons.visibility_off),
                ),
              ),
              validator: (value) {
                if ((value ?? "").isEmpty) {
                  return "Please enter an email";
                }
                return null;
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer(builder: (context, ref, _) {
                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.controller.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                      ref
                          .read(authProvider.notifier)
                          .setPassword(textcontroller.text);
                    }
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
      ),
    );
  }
}
