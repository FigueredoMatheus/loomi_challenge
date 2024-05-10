import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerForward extends StatelessWidget {
  final VideoPlayerController playerController;

  const MoviePlayerForward({super.key, required this.playerController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => playerController.seekTo(
        Duration(seconds: playerController.value.position.inSeconds + 15),
      ),
      child: SvgPicture.asset(
        'assets/icons/forward_15_icon.svg',
        semanticsLabel: 'forward_15',
        fit: BoxFit.scaleDown,
        height: 30,
        width: 30,
      ),
    );
  }
}
