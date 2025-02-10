import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinterestclone/features/auth/providers/auth_provider.dart';
import 'package:pinterestclone/features/auth/view/image_preview.dart';
import 'package:pinterestclone/features/auth/view/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'password_screen.dart';
import 'widget/social_auth_widget.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pickedImage =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (pickedImage != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ImagePreview(
                  path: pickedImage.path,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Please pick an image")));
          }
        },
        child: Icon(Icons.camera),
      ),
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
                Consumer(builder: (context, ref, _) {
                  return ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final supabaseClient = Supabase.instance.client;
                      try {
                        await supabaseClient
                            .from("user")
                            .select('id')
                            .eq('email', emailController.text)
                            .single();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen(
                                  email: emailController.text,
                                )));
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
                        ref
                            .read(authProvider.notifier)
                            .setEmail(emailController.text);
                      }
                    },
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text("Continue"),
                  );
                }),
                SizedBox(
                  height: 32,
                ),
                SocialAuthWidget(),
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
