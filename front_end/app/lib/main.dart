import 'package:app/assistant/global.dart';
import 'package:app/presentation/screens/home_page/home_screen.dart';
import 'package:app/presentation/screens/intro_screen.dart';
import 'package:app/presentation/screens/login_screen.dart';
import 'package:app/presentation/screens/register_screen.dart';
import 'package:app/presentation/screens/welcommingScreen/welcomming_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'config/routes/app_routes.dart';

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

  final routes = AppRoutes.generateRoutes();
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: kBackgroundColor,
      home: HomeScreen(),
    );

    // MaterialApp.router(
    //   routerDelegate: routes.routerDelegate,
    //   routeInformationParser: routes.routeInformationParser,
    //   routeInformationProvider: routes.routeInformationProvider,
    //   title: "Trip Manage expense ",
    //   debugShowCheckedModeBanner: false,
    //   themeMode: ThemeMode.light,
    // );
  }

  // const MaterialApp(
  //   home: Scaffold(backgroundColor: Color(0xffF3F8FE), body: WelcomeScreen()),
  // );
}
