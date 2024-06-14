import 'package:flutter/material.dart';

class Custom_Textformfeild extends StatelessWidget {
  String unvaildText;
  final String hinttext;
  TextEditingController textEditingController;
  final Color textcolor;
  final Color borderColor;
  IconData icon;
  final int maxline;
  Custom_Textformfeild(
      {super.key,
      required this.hinttext,
      required this.textEditingController,
      this.textcolor = Colors.black,
      this.maxline=1,
      this.borderColor = Colors.black,
      required this.icon, required this.unvaildText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.blue,
      maxLines: maxline,
      validator: (value)  {
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
