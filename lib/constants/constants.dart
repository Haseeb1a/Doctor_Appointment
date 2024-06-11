import 'package:flutter/widgets.dart';

class CustomBox {
  // for the height
  static Widget height(double height) {
    return SizedBox(height: height);
  }

// for the width
  static width(double width) {
    return SizedBox(width: width);
  }

// for the both
  static Widget sizedBox(double height, double width) {
    return SizedBox(height: height, width: width);
  }
}