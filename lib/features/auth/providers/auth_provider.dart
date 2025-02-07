import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinterestclone/core/api_response_enum.dart';
import 'package:pinterestclone/features/auth/model/interest_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  String? email;
  String? password;
  String? name;
  int? age;
  List<InterestModel> selectedInterest = [];

  ApiState apiState = ApiState.initial;
  ApiState createUserState = ApiState.initial;

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

  void setInterest(List<InterestModel> interests) {
    selectedInterest = interests;
    notifyListeners();
  }

  createUser() async {
    createUserState = ApiState.loading;
    notifyListeners();
    try {
      final AuthResponse res = await Supabase.instance.client.auth
          .signUp(email: email, password: password!, data: {
        "age": age,
        "name": name,
        "interests": selectedInterest.map((e) => e.id).toList(),
      });
      final userData = await Supabase.instance.client.from("user").insert({
        "id": res.user!.id,
        "name": name,
        "email": email,
        "age": age,
        "gender": "male",
      });

      createUserState = ApiState.success;
    } catch (e) {
      createUserState = ApiState.error;
    }
  }
}
