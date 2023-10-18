import 'package:flutter/material.dart';

class Responsive {
  static double width(double width, BuildContext context) {
    return MediaQuery.of(context).size.width * (width / 392.72);
  }

  static double height(double hight, BuildContext context) {
    return MediaQuery.of(context).size.height * (hight / 783.27);
  }
}
