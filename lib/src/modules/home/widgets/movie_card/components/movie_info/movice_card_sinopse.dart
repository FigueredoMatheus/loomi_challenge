import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class MovieCardSinopse extends StatelessWidget {
  final String sinopse;

  const MovieCardSinopse({super.key, required this.sinopse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Text(
        sinopse,
        style: MyAppKColors.movieCardSinopse(),
      ),
    );
  }
}
