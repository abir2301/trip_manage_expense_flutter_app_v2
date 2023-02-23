import 'package:flutter/material.dart';

class LoginOptions extends StatelessWidget {
  final double? size;
  final String img1;
  final String img2;

  LoginOptions({required this.size, required this.img1, required this.img2});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              img1,
              height: size,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              img2,
              height: size,
            ),
          ),
        ),
      ],
    );
  }
}
