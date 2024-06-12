import 'package:doctor_appointment/constants/consts.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message, {VoidCallback? onPressed}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
     
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: AppColors.darkFontGrey,
      duration: Duration(seconds: 3), // Adjust the duration as needed
      action: onPressed != null
          ? SnackBarAction(
              label: 'Action',
              onPressed: onPressed,
            )
          : null,
    ),
  );
}
