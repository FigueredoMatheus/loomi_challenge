import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:video_player/video_player.dart';

class MovieProgressTime extends StatefulWidget {
  final VideoPlayerController playerController;
  const MovieProgressTime({super.key, required this.playerController});

  @override
  State<MovieProgressTime> createState() => _MovieProgressTimeState();
}

class _MovieProgressTimeState extends State<MovieProgressTime> {
  @override
  Widget build(BuildContext context) {
    final movieProgressTime = calculateTotalDuration(
      widget.playerController.value.position.inHours,
      widget.playerController.value.position.inMinutes,
      widget.playerController.value.position.inSeconds,
    );

    final movieTotalDuration = calculateTotalDuration(
      widget.playerController.value.duration.inHours,
      widget.playerController.value.duration.inMinutes,
      widget.playerController.value.duration.inSeconds,
    );

    return Text(
      '$movieProgressTime / $movieTotalDuration',
      style: MyThemes.get().epilogueStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  String calculateTotalDuration(int hours, int minutes, int seconds) {
    int totalSeconds = hours * 3600 + minutes * 60 + seconds;

    int calculatedHours = totalSeconds ~/ 3600;

    int remainingSeconds = totalSeconds % 3600;
    int calculatedMinutes = remainingSeconds ~/ 60;

    int calculatedSeconds = remainingSeconds % 60;

    String formattedDuration = '';
    if (calculatedHours > 0) {
      formattedDuration += '${calculatedHours.toString().padLeft(2, '0')}:';
    }
    formattedDuration +=
        '${calculatedMinutes.toString().padLeft(2, '0')}:${calculatedSeconds.toString().padLeft(2, '0')}';

    return formattedDuration;
  }
}
