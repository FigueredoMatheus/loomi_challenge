import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class PausePlayMovieWidget extends StatelessWidget {
  final VideoPlayerController playerController;
  const PausePlayMovieWidget({super.key, required this.playerController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => playerController.value.isPlaying
          ? playerController.pause()
          : playerController.play(),
      child: Icon(
        playerController.value.isPlaying
            ? FontAwesomeIcons.circlePause
            : FontAwesomeIcons.circlePlay,
        color: Colors.white,
        size: 60,
      ),
    );
  }
}
