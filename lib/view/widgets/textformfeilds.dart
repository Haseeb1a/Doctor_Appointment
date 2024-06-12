import 'package:flutter/material.dart';

class Custom_Textformfeild extends StatelessWidget {
  final String hinttext;
  TextEditingController textEditingController;
  final Color textcolor;
  final Color borderColor;
  IconData icon;
  Custom_Textformfeild(
      {super.key,
      required this.hinttext,
      required this.textEditingController,
      this.textcolor = Colors.black,
      this.borderColor = Colors.black,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        
          prefixIcon: Icon(
            icon,
            color: Colors.blue.shade700,
          ),
          labelText: hinttext,
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
