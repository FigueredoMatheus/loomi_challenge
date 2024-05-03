import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.58,
      width: 207.77,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
