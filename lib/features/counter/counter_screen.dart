import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinterestclone/features/counter/counter_provider.dart';
import 'package:pinterestclone/features/counter/counter_screen_two.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Text(
          counterState.value.toString(),
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CounterScreenTwo()));
          },
          child: Text("data")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider).increment();
        },
      ),
    );
  }
}
