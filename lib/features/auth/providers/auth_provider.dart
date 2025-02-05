import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  String? email;
  String? password;
  String? name;
  int? age;

  void setEmail(String providedEmail) {
    email = providedEmail;
    notifyListeners();
  }

  void setPassword(String providedPassword) {
    password = providedPassword;
    notifyListeners();
  }

  void setAge(DateTime providedDate) {
    age = DateTime.now().year - providedDate.year;
    notifyListeners();
  }

  void setName(String providedname) {
    name = providedname;
    notifyListeners();
  }
}
