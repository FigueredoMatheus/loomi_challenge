import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/auth_service.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';
import 'package:provider/provider.dart';

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
        return logoutOnTap();
    }
  }

  logoutOnTap() async {
    loadingDialog();
    await Provider.of<AuthService>(context, listen: false).logout();
    Get.offAllNamed(RoutesNames.loginPageView);
  }

  editProfileOnTap() => Get.toNamed(RoutesNames.editProfilePageView);

  Color getButtonColor() {
    switch (widget.buttonType) {
      case CustomOutlinedButtonType.editProfile:
        return MyAppKColors.kPurpleColor;
      case CustomOutlinedButtonType.logout:
      default:
        return MyAppKColors.kOutlinedButtonTextColor;
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
