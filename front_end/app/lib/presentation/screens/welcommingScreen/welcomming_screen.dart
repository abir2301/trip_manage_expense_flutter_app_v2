import 'package:flutter/material.dart';

import 'components/intro_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child:  Container(
          width: MediaQuery.of(context).size.height * 0.75,
          height: MediaQuery.of(context).size.height * 0.5,
          child: IntroButton(MediaQuery.of(context).size * 1.5, context)),
    ));
  }
}
