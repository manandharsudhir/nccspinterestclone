import 'package:flutter/material.dart';

class AuthCheckerScreen extends StatelessWidget {
  const AuthCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/login_image.png"),
          Text(
            "Create the life you love in pinterest",
          ),
          TextField(),
          ElevatedButton(
            onPressed: () {},
            child: Text("Continue"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  "assets/logos/pinterest.png",
                  height: 20,
                  width: 20,
                ),
                Text("Continue with google"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  "assets/logos/pinterest.png",
                  height: 20,
                  width: 20,
                ),
                Text("Continue with Facebook"),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "By continuing you agree to pinterest",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Terms of Service",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(text: "and acknowledge that you have read"),
                TextSpan(text: "Privacy and policy"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
