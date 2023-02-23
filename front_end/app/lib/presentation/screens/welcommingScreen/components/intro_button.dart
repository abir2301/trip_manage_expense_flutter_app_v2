import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

import '../../intro_screen.dart';

Widget IntroButton(Size size, BuildContext context) {
  return TextButton(
      onPressed: () {},
      child: NeumorphicButton(
        onTap: () {
          // print("cliccked button ");
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => IntroScreen(),
          //   ),
          // );
          context.go('/introScreen');
        },
        borderRadius: 180,
        bottomRightShadowSpreadRadius: 1,
        borderWidth: 5,
        boxShape: BoxShape.rectangle,
        backgroundColor: Colors.white,
        topLeftShadowBlurRadius: 5,
        topLeftShadowSpreadRadius: 1,
        topLeftShadowColor: Colors.white,
        bottomRightShadowColor: Colors.grey.shade500,
        height: size.width * 0.5,
        width: size.width * 0.5,
        padding: EdgeInsets.all(5),
        bottomRightOffset: Offset(4, 4),
        topLeftOffset: Offset(-4, -4),
        child: Center(
          child: Image.asset(
            'assets/logo.png',
            height: 700,
            width: size.width,
            // color: Colors.grey[700],
          ),
        ),
      ));
}
