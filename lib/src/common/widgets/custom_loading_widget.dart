import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class CustomLoadingWidget extends StatelessWidget {
  final double loadingSize;

  const CustomLoadingWidget({super.key, this.loadingSize = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: loadingSize,
      width: loadingSize,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyThemes.get().kVeryDarkGrayColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: FittedBox(
        fit: BoxFit.cover,
        child: CircularProgressIndicator(
          color: MyThemes.get().kPurpleColor,
        ),
      ),
    );
  }
}
