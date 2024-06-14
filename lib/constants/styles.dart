
import 'package:flutter/material.dart';
class AppStyles {

  // normal text style---------------------
  static  normalText({
    required String title, 
    Color color = Colors.black, 
     double? size }) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }

  // bold text style---------------------
    static Text boldText({
    required String title,
    Color color = Colors.black,
    double size = 18.0,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }


    static final BoxDecoration shadowDecoraion = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.black.withOpacity(0.09),

            //  .withOpacity(0.09),
            blurRadius: 10.0,
            spreadRadius: 4.0)
      ]);
}