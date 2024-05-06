import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/helpers/extensions/on_string_extension.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

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
    return CachedNetworkImage(
      imageUrl: imagePath,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return SizedBox(
          height: 10,
          width: 10,
          child: Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              strokeWidth: 1,
              color: MyAppKColors.kPurpleColor,
            ),
          ),
        );
      },
    );
  }

  Image showFileImage() {
    return Image.file(
      File(imagePath),
      fit: BoxFit.cover,
    );
  }
}
