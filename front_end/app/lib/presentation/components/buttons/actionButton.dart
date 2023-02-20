import 'package:app/assistant/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ActionButton(Function fn, String text) {
  return GestureDetector(
    onTap: fn(),
    child: Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
