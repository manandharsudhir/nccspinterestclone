import 'package:flutter/material.dart';
import 'package:pinterestclone/features/homepage/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/view/auth_checker_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async {
      final sharedPref = await SharedPreferences.getInstance();
      final token = sharedPref.getString(
        "token",
      );
      if (token == null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return AuthCheckerScreen();
        }));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return Homepage();
        }));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logos/pinterest.png",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
