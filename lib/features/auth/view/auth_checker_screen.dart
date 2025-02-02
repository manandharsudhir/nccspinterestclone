import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'password_screen.dart';

class AuthCheckerScreen extends StatefulWidget {
  const AuthCheckerScreen({super.key});

  @override
  State<AuthCheckerScreen> createState() => _AuthCheckerScreenState();
}

class _AuthCheckerScreenState extends State<AuthCheckerScreen> {
  final emailController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset("assets/images/login_image.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Create designs that you love",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "Enter Email"),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    final supabaseClient = Supabase.instance.client;
                    try {
                      final user = await supabaseClient
                          .from("user")
                          .select('id')
                          .eq('email', emailController.text)
                          .single();
                      print(user);
                    } catch (e) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PasswordScreen(),
                        ),
                      );
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text("Continue"),
                ),
                SizedBox(
                  height: 32,
                ),
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
                SizedBox(
                  height: 32,
                ),
                Text(
                  "By continuing agree to terms and condition",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
