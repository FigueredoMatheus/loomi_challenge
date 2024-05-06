import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final CustomOutlinedButtonType buttonType;

  const CustomOutlinedButton({super.key, required this.buttonType});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(getButtonText()),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(GoogleFonts.epilogue(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: getButtonColor(),
        )),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return Colors.transparent;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
                side: BorderSide(
                  color: getButtonColor(),
                  width: 1,
                ))),
      ),
    );
  }

  onPressed() {
    switch (buttonType) {
      case CustomOutlinedButtonType.editProfile:
        return editProfileOnTap();
      case CustomOutlinedButtonType.logout:
      default:
        return logoutOnTap();
    }
  }

  logoutOnTap() {
    print('--- LOGOUT ON TAP');
  }

  editProfileOnTap() {
    print('--- EDIT PROFILE ON TAP');
  }

  Color getButtonColor() {
    switch (buttonType) {
      case CustomOutlinedButtonType.editProfile:
        return MyAppKColors.kPurpleColor;
      case CustomOutlinedButtonType.logout:
      default:
        return MyAppKColors.kOutlinedButtonTextColor;
    }
  }

  String getButtonText() {
    switch (buttonType) {
      case CustomOutlinedButtonType.editProfile:
        return 'Edit Profile';
      case CustomOutlinedButtonType.logout:
      default:
        return 'Log out';
    }
  }
}
