import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Budget',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF181A20),
        fontFamily: 'Roboto',
      ),

      home: const SplashScreen(),
    );
  }
}