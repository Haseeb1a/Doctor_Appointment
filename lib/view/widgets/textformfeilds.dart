import 'package:doctor_appointment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Custom_Textformfeild extends StatelessWidget {
  String unvaildText;
  final String hinttext;
  TextEditingController textEditingController;
  final Color textcolor;
  final Color borderColor;
  final Color hintcolor;
  IconData icon;
  final int maxline;
  final Color iconColor;
  Custom_Textformfeild(
      {super.key,
      required this.hinttext,
      required this.textEditingController,
      this.hintcolor = Colors.black,
      this.textcolor = Colors.black,
      this.maxline = 1,
      this.borderColor = Colors.black,
      this.iconColor = AppColors.primary,
      required this.icon,
      required this.unvaildText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.blue,
      maxLines: maxline,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $unvaildText';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          //  contentPadding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),

          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          labelText: hinttext,
          labelStyle: TextStyle(color: hintcolor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
