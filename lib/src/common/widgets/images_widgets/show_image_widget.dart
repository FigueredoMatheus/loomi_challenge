import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/custom_file_image.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/custom_network_image.dart';
import 'package:loomi_challenge/src/core/helpers/extensions/on_string_extension.dart';

class CustomShowImageWidget extends StatelessWidget {
  final String imagePath;
  final double size;
  final double radius;
  final double? height;
  final double? width;
  final double? imageRadiusTopLeft;
  final double? imageRadiusTopRight;
  final double? imageRadiusBottomLeft;
  final double? imageRadiusBottomRight;

  const CustomShowImageWidget({
    super.key,
    required this.imagePath,
    required this.size,
    required this.radius,
    this.height,
    this.width,
    this.imageRadiusTopLeft,
    this.imageRadiusTopRight,
    this.imageRadiusBottomLeft,
    this.imageRadiusBottomRight,
  });

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = imagePath.isNetworkUrl();
    final imageHeight = height ?? size;
    final imageWidth = width ?? size;
    final radiusBottomLeft = imageRadiusBottomLeft ?? radius;
    final radiusBottomRight = imageRadiusBottomRight ?? radius;
    final radiusTopLeft = imageRadiusTopLeft ?? radius;
    final radiusTopRight = imageRadiusTopRight ?? radius;

    return isNetworkImage
        ? CustomNetworkImage(
            imageUrl: imagePath,
            height: imageHeight,
            width: imageWidth,
            imageRadiusBottomLeft: radiusBottomLeft,
            imageRadiusBottomRight: radiusBottomRight,
            imageRadiusTopLeft: radiusTopLeft,
            imageRadiusTopRight: radiusTopRight,
          )
        : CustomFileImage(
            imagePath: imagePath,
            height: imageHeight,
            width: imageWidth,
            imageRadiusBottomLeft: radiusBottomLeft,
            imageRadiusBottomRight: radiusBottomRight,
            imageRadiusTopLeft: radiusTopLeft,
            imageRadiusTopRight: radiusTopRight,
          );
  }
}
