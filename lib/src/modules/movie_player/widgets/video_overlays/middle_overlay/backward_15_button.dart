import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerBackward extends StatelessWidget {
  final VideoPlayerController playerController;

  const MoviePlayerBackward({super.key, required this.playerController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => playerController.seekTo(
        Duration(seconds: playerController.value.position.inSeconds - 15),
      ),
      child: SvgPicture.asset(
        'assets/icons/backward_15_icon.svg',
        semanticsLabel: 'backward_15',
        fit: BoxFit.scaleDown,
        height: 30,
        width: 30,
      ),
    );
  }
}
