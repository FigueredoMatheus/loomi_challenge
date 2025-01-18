import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final double containerWidth;
  final Function() onPressed;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.containerWidth = 207.77,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.58,
      width: containerWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(241, 204, 76, 0.2),
            blurRadius: 10.33,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
