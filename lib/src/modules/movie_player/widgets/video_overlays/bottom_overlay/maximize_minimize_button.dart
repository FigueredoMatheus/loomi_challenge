import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaximizeMinimizeButton extends StatefulWidget {
  const MaximizeMinimizeButton({super.key});

  @override
  State<MaximizeMinimizeButton> createState() => _MaximizeMinimizeButtonState();
}

class _MaximizeMinimizeButtonState extends State<MaximizeMinimizeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        'assets/icons/full_screen_minimize_icon.svg',
        semanticsLabel: 'forward_15',
        fit: BoxFit.scaleDown,
        height: 30,
        width: 30,
      ),
    );
  }
}
