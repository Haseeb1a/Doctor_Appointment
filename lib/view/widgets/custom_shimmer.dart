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
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }
}
