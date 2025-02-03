import 'package:flutter/material.dart';

class SocialAuthWidget extends StatelessWidget {
  const SocialAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/logos/pinterest.png",
                height: 16,
                width: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Text("Continue with Google"),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/logos/pinterest.png",
                height: 16,
                width: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Text("Continue with Facebook"),
            ],
          ),
        ),
      ],
    );
  }
}
