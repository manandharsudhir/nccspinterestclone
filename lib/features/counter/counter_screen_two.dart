import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinterestclone/features/counter/counter_provider.dart';

class CounterScreenTwo extends ConsumerWidget {
  const CounterScreenTwo({super.key});

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider).decrement();
        },
      ),
    );
  }
}
