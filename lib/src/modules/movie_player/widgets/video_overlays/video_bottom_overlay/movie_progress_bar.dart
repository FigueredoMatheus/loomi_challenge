import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MovieProgressBar extends StatelessWidget {
  final VideoPlayerController playerController;
  const MovieProgressBar({super.key, required this.playerController});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: VideoProgressIndicator(
        playerController,
        allowScrubbing: true,
      ),
    );
  }
}
