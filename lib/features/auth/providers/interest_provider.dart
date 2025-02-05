import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinterestclone/features/auth/model/interest_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final interestProvider = ChangeNotifierProvider((ref) => InterestProvider());

class InterestProvider extends ChangeNotifier {
  List<InterestModel> interest = [
    InterestModel(id: "", image: "", name: "basketball"),
    InterestModel(id: "", image: "", name: "basketball"),
  ];

  ApiState apiState = ApiState.initial;

  getAllInterest() async {
    apiState = ApiState.loading;
    notifyListeners();
    try {
      final response =
          await Supabase.instance.client.from("interests").select();
      interest = response.map((e) => InterestModel.fromJson(e)).toList();
      apiState = ApiState.success;
    } catch (e) {
      apiState = ApiState.error;
    } finally {
      notifyListeners();
    }
  }

  selectInterest(int index) {
    interest[index].isSelected = !interest[index].isSelected;
    notifyListeners();
  }
}

enum ApiState {
  loading,
  initial,
  success,
  error,
}
