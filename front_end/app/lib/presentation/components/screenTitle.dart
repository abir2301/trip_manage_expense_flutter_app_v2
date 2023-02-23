import 'package:flutter/cupertino.dart';

import '../../assistant/global.dart';

class ScreenTitle extends StatelessWidget {
  String title;
  ScreenTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          title,
          style: ktitle,
        ),
      ),
    );
  }
}
