import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaximizeMinimizeButton extends StatefulWidget {
  const MaximizeMinimizeButton({super.key});

  @override
  State<MaximizeMinimizeButton> createState() => _MaximizeMinimizeButtonState();
}

class _MaximizeMinimizeButtonState extends State<MaximizeMinimizeButton> {
  void setLandScape() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode
          .immersiveSticky, //SystemUiMode.manual, //SystemUiMode.immersive,
      // overlays: [
      //   SystemUiOverlay.bottom
      // ],
      //Apenas o statusBar bottom será mostrado
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void setPortait() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
        SystemUiOverlay.top,
      ],
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final isPortrait = orientation == Orientation.portrait;
      return IconButton(
        onPressed: () => isPortrait ? setLandScape() : setPortait(),
        icon: const Icon(
          Icons.fullscreen,
          color: Colors.white,
        ),
      );
    });
  }
}
