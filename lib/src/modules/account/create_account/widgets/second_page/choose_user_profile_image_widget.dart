import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class CreateUserAccountChooseUserProfileImageWidget extends StatefulWidget {
  const CreateUserAccountChooseUserProfileImageWidget({super.key});

  @override
  State<CreateUserAccountChooseUserProfileImageWidget> createState() =>
      _CreateUserAccountChooseUserProfileImageWidgetState();
}

class _CreateUserAccountChooseUserProfileImageWidgetState
    extends State<CreateUserAccountChooseUserProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [profileImageContainer(), profileImageInfo()],
    );
  }

  Widget profileImageContainer() {
    return InkWell(
      onTap: () {
        print('--- Choose image TAPPED');
      },
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      child: Container(
        width: 116,
        height: 116,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: MyAppKColors.kLightPurpleColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(34),
        ),
        child: SvgPicture.asset(
          'assets/icons/camera_icon.svg',
          semanticsLabel: 'Camera',
          fit: BoxFit.scaleDown,
          height: 18,
          width: 20,
        ),
      ),
    );
  }

  Widget profileImageInfo() {
    return Container(
      width: 91,
      child: Column(
        children: [
          Text(
            'Choose Image',
            style: MyAppKColors.title3(),
          ),
          Text(
            'A square .jpg, .gif, or .png image 200x200 or larger',
            style: MyAppKColors.subtitle3(),
          ),
        ],
      ),
    );
  }
}
