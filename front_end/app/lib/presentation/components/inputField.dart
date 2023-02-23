import 'package:flutter/material.dart';

import '../../assistant/global.dart';

class InputField extends StatelessWidget {
  String labelText;
  TextEditingController controller;
  String placeholderText;
  IconData icon;
  IconData? sufixIcon;
  bool? obsecureText;
  Function validator;
  Function? onsubmit;
  Function? onChange;
  TextInputType inputType;
  var kLabelStyle;
  InputField(
      {required this.labelText,
      required this.controller,
      required this.placeholderText,
      this.sufixIcon,
      required this.icon,
      required this.validator,
      this.onsubmit,
      required this.inputType,
      this.onChange,
      this.obsecureText});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: kBoxDecoration,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 5, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labelText, style: kLabelStyle),
              TextField(
                obscureText: obsecureText ?? false,
                controller: controller,
                keyboardType: inputType,
                cursorColor: Colors.black,
                style: kPlaceholderStyle,
                decoration: InputDecoration(
                    prefixIcon: Icon(icon),
                    suffixIcon: Icon(sufixIcon),
                    prefixIconColor: kiconColor,
                    hintText: placeholderText,
                    border: InputBorder.none),
              ),
            ],
          ),
        ));

    ;
  }
}
