import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

// ignore: non_constant_identifier_names
Widget WaveScreens(String assetName, double width, double height) {
  return Positioned(
      top: 0,
      child: SvgPicture.asset(
        'assets/$assetName',
        width: width,
        height: height,
      ));
}
