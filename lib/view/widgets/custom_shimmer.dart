import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Custom_Shimmer extends StatelessWidget {
  final height;
  final width;
  Custom_Shimmer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        width: width,
        height: height,
       decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        
      ),
    );
  }
}
