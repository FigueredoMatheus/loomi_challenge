import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class MovieCardGenre extends StatelessWidget {
  final String genre;
  const MovieCardGenre({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Text(
      genre,
      maxLines: 2,
      style: MyThemes.get().epilogueStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
