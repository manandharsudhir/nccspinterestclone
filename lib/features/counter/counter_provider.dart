import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = ChangeNotifierProvider((ref) => CounterProvider());

class CounterProvider extends ChangeNotifier {
  int value = 1;

  increment() {
    value += 1;
    notifyListeners();
  }

  decrement() {
    value -= 1;
    notifyListeners();
  }
}
