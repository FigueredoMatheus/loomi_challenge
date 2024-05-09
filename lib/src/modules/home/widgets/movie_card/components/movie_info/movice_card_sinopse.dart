import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class MovieCardSynopse extends StatelessWidget {
  final String synopsis;

  const MovieCardSynopse({super.key, required this.synopsis});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Text(
        synopsis,
        style: MyThemes.get().epilogueStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
