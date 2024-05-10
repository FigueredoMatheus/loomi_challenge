import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class MoviePlayerMovieTitleOverlay extends StatelessWidget {
  const MoviePlayerMovieTitleOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'CustomBackButton',
      style: MyThemes.get().epilogueStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
