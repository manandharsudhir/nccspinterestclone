import 'package:flutter/material.dart';

class InterestSelectionScreen extends StatefulWidget {
  const InterestSelectionScreen({super.key});

  @override
  State<InterestSelectionScreen> createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) => Container(
        color: Colors.red,
        child: Text(
          index.toString(),
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }
}
