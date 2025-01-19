import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/user_settings/store/profile_settings_store.dart';

class CustomOutlinedButton extends StatefulWidget {
  final CustomOutlinedButtonType buttonType;

  const CustomOutlinedButton({super.key, required this.buttonType});

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        getButtonText(),
        style: GoogleFonts.epilogue(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: getButtonColor(),
        ),
      ),
      style: ButtonStyle(
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
    switch (widget.buttonType) {
      case CustomOutlinedButtonType.editProfile:
        return editProfileOnTap();
      case CustomOutlinedButtonType.logout:
      default:
        return getIt<ProfileSettingsStore>().onLogout();
    }
  }

  editProfileOnTap() => Get.toNamed(RoutesNames.EDIT_PROFILE_PAGE_VIEW);

  Color getButtonColor() {
    switch (widget.buttonType) {
      case CustomOutlinedButtonType.editProfile:
        return MyThemes.get().kPurpleColor;
      case CustomOutlinedButtonType.logout:
      default:
        return MyThemes.get().kOutlinedButtonTextColor;
    }
  }

  String getButtonText() {
    switch (widget.buttonType) {
      case CustomOutlinedButtonType.editProfile:
        return 'Edit Profile';
      case CustomOutlinedButtonType.logout:
      default:
        return 'Log out';
    }
  }
}
