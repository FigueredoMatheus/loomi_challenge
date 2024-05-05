import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class MovieCardGenre extends StatelessWidget {
  final List<String> genreList;
  const MovieCardGenre({super.key, required this.genreList});

  @override
  Widget build(BuildContext context) {
    return Text(
      getText(),
      maxLines: 2,
      style: MyAppKColors.movieCardGenre(),
    );
  }

  String getText() {
    String text = '';

    for (var i = 0; i < genreList.length; i++) {
      if (i == 0) {
        text += genreList[0];
      } else {
        text += ', ' + genreList[i];
      }
    }

    return text;
  }
}
