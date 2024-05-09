import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingShimmerStyle extends StatelessWidget {
  final double width;
  final double height;
  final double bottomPadding;
  final double marginRight;
  const CustomLoadingShimmerStyle({
    super.key,
    required this.width,
    required this.height,
    required this.bottomPadding,
    this.marginRight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xFFFFFFFF),
      highlightColor: Color(0xFFFFFFFF).withOpacity(0.05),
      period: Duration(milliseconds: 1000),
      direction: ShimmerDirection.ltr,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(bottom: bottomPadding, right: marginRight),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // White
              Color(0xFFFFFFFF).withOpacity(0.05), // 5% Opacity White
            ],
            stops: [0.0, 0.95], // Adjust stop positions
          ),
        ),
      ),
    );
  }
}
