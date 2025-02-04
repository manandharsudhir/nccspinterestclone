import 'package:flutter/material.dart';
import 'package:pinterestclone/features/auth/view/widget/social_auth_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.email});

  final String email;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  final emailController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SocialAuthWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Or",
                  textAlign: TextAlign.center,
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if ((value ?? "").isEmpty) {
                    return "Please enter an email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
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
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState!.validate();
                },
                child: Text("Login"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Fogotten Password?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
