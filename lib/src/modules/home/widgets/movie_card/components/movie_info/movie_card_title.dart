import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class MovieCardTitle extends StatelessWidget {
  final String title;

  const MovieCardTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        title,
        style: MyAppKColors.movieCardTitle(),
      ),
    );
  }
}
