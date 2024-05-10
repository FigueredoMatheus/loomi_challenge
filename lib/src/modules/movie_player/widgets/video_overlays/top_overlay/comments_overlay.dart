import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class MoviePlayerCommentsOverlay extends StatelessWidget {
  const MoviePlayerCommentsOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/icons/comments_icon.svg',
          semanticsLabel: 'forward_15',
          fit: BoxFit.scaleDown,
          height: 30,
          width: 30,
        ),
        const SizedBox(width: 5),
        Text(
          'Comments 324',
          style: MyThemes.get().epilogueStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
