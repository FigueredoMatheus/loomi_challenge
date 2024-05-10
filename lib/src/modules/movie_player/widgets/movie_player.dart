import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatelessWidget {
  final VideoPlayerController playerController;

  const MoviePlayer({super.key, required this.playerController});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        height: playerController.value.size.height,
        width: playerController.value.size.width,
        child: AspectRatio(
          aspectRatio: playerController.value.aspectRatio,
          child: VideoPlayer(playerController),
        ),
      ),
    );
  }
}
