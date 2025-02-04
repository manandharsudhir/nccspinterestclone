import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(name),
    );
  }
}
