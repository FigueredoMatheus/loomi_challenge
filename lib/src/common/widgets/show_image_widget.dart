import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/helpers/extensions/on_string_extension.dart';

class CustomShowImageWidget extends StatelessWidget {
  final String imagePath;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;

  const CustomShowImageWidget({
    super.key,
    required this.imagePath,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = imagePath.isNetworkUrl();

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeftRadius),
        bottomRight: Radius.circular(bottomRightRadius),
        topLeft: Radius.circular(topLeftRadius),
        topRight: Radius.circular(topRightRadius),
      ),
      child: isNetworkImage ? showNetworkImage() : showFileImage(),
    );
  }

  CachedNetworkImage showNetworkImage() {
    return CachedNetworkImage(imageUrl: imagePath);
  }

  Image showFileImage() {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }
}
