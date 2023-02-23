import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  String? text;
  Categories({required this.text, super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    print("${widget.text}");
    return Center(
      child: Container(
        child: Text("${widget.text}"),
      ),
    );
  }
}
