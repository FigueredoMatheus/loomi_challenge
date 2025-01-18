import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/home/widgets/custon_loading_shimmer_style.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final double imageRadiusTopLeft;
  final double imageRadiusTopRight;
  final double imageRadiusBottomLeft;
  final double imageRadiusBottomRight;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.imageRadiusTopLeft,
    required this.imageRadiusTopRight,
    required this.imageRadiusBottomLeft,
    required this.imageRadiusBottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(imageRadiusTopLeft),
              topRight: Radius.circular(imageRadiusTopRight),
              bottomLeft: Radius.circular(imageRadiusBottomLeft),
              bottomRight: Radius.circular(imageRadiusBottomRight),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return CustomLoadingShimmerStyle(
          width: width,
          height: height,
          bottomPadding: 0,
        );
      },
      errorWidget: (context, url, error) {
        final double iconSize = height * 0.50 > 60 ? 60 : height * 0.50;
        final showErrorText = height > 150;
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(imageRadiusTopLeft),
              topRight: Radius.circular(imageRadiusTopRight),
              bottomLeft: Radius.circular(imageRadiusBottomLeft),
              bottomRight: Radius.circular(imageRadiusBottomRight),
            ),
            color: MyThemes.get().kGrayColor.withOpacity(0.2),
          ),
          alignment: showErrorText ? Alignment.topCenter : Alignment.center,
          child: Column(
            mainAxisAlignment: showErrorText
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: MyThemes.get().kWhiteColor,
                size: iconSize,
              ),
              if (showErrorText) AutoSizeText('Image Error: $error'),
            ],
          ),
        );
      },
    );
  }
}
