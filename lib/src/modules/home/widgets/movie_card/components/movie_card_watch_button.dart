import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/custom_elevated_button.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';

class MovieCardWatchButton extends StatelessWidget {
  final MovieEntity movie;

  const MovieCardWatchButton({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 20),
      child: Align(
        child: CustomElevatedButton(label: 'Watch', onPressed: () async {}),
        alignment: Alignment.center,
      ),
    );
  }
}
