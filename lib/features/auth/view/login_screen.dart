import 'package:flutter/material.dart';
import 'package:pinterestclone/features/auth/view/widget/social_auth_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
              TextField(),
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
