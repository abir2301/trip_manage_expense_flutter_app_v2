import 'package:app/presentation/screens/intro_screen.dart';
import 'package:app/presentation/screens/register_screen.dart';
import 'package:app/presentation/screens/welcomming_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(backgroundColor: Color(0xffF3F8FE), body: WelcomeScreen()),
    );
  }
}
