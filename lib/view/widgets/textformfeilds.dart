import 'package:flutter/material.dart';

class Custom_Textformfeild extends StatelessWidget {
  final String hinttext;
   TextEditingController textEditingController;
   Custom_Textformfeild({super.key,required this.hinttext, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  
                  decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    hintText: hinttext),
                );
  }
}
