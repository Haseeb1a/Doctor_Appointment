import 'package:flutter/material.dart';

class Custom_Textformfeild extends StatelessWidget {
  final String hinttext;
  TextEditingController textEditingController;
  final Color textcolor;
  final Color borderColor;
  Custom_Textformfeild(
      {super.key,
      required this.hinttext,
      required this.textEditingController,
      this.textcolor = Colors.black,
      this.borderColor=Colors.black});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor )
          ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor )
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor )
          ),
          hintText: hinttext,
          hintStyle: TextStyle(color: textcolor)),
    );
  }
}
