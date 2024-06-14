import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final Icon icons;
  final Color? color;
  final VoidCallback? onPressed;

  const TransparentButton({
    required this.icons,
    this.color,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Color.fromARGB(146, 58, 52, 52),
        ),
        height: 50,
        width: 50,
        child: icons,
      ),
    );
  }
}
