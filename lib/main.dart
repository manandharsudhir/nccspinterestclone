import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinterestclone/features/counter/counter_screen.dart';

import 'features/splashscreen/view/splash_screen.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://okzrrsuefvyzxlhgqhjg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9renJyc3VlZnZ5enhsaGdxaGpnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg0NjA0ODcsImV4cCI6MjA1NDAzNjQ4N30.Vmv6cXn0j4yS-UN2wXZ35McqK5HaqIYbKP5GUoajmtA',
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
      theme: ThemeData(
        primaryColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            textStyle: TextStyle(
              fontSize: 16,
            ),
            elevation: 10,
          ),
        ),
      ),
    );
  }
}
