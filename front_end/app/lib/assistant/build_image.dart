import 'package:flutter/cupertino.dart';

// ignore: unused_element
Widget buildImage(String assetName, [double width = 180]) {
  return Image.asset('$assetName', width: width);
}
