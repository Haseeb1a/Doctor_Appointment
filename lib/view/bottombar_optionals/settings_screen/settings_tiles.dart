import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onPressed;

  SettingsTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, 
      child: ListTile(
        leading: icon,
        title: Text(text),
      ),
    );
  }
}
