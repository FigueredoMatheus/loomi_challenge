import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:video_player/video_player.dart';

class MovieProgressBar extends StatelessWidget {
  final VideoPlayerController playerController;
  const MovieProgressBar({super.key, required this.playerController});

  @override
  Widget build(BuildContext context) {
    return VideoProgressIndicator(
      playerController,
      allowScrubbing: true,
      colors: VideoProgressColors(
        backgroundColor: Colors.white.withOpacity(0.33),
        playedColor: MyThemes.get().kLightPurpleColor,
      ),
    );
  }
}
