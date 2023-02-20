import 'package:flutter/material.dart';

import '../../assistant/global.dart';

Widget InputField(String labelText, TextEditingController controller,
    String placeholderText, IconData icon, bool obsecureText) {
  var kLabelStyle;
  return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.03),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, bottom: 5, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(labelText, style: kLabelStyle),
            TextField(
              obscureText: obsecureText,
              controller: controller,
              cursorColor: Colors.black,
              style: kPlaceholderStyle,
              decoration: InputDecoration(
                  prefixIcon: Icon(icon),
                  prefixIconColor: kiconColor,
                  hintText: placeholderText,
                  border: InputBorder.none),
            ),
          ],
        ),
      ));

  ;
}
