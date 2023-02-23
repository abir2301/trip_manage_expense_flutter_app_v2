import 'package:app/assistant/global.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
class ActionButton extends StatelessWidget {
  Function fn;
  String text;
  ActionButton({required this.text, required this.fn});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: fn(),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
