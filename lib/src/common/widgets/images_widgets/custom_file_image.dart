import 'dart:io';

import 'package:flutter/material.dart';

class CustomFileImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final double imageRadiusTopLeft;
  final double imageRadiusTopRight;
  final double imageRadiusBottomLeft;
  final double imageRadiusBottomRight;

  const CustomFileImage({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    required this.imageRadiusTopLeft,
    required this.imageRadiusTopRight,
    required this.imageRadiusBottomLeft,
    required this.imageRadiusBottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(imageRadiusBottomLeft),
        bottomRight: Radius.circular(imageRadiusBottomRight),
        topLeft: Radius.circular(imageRadiusTopLeft),
        topRight: Radius.circular(imageRadiusTopRight),
      ),
      child: Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
