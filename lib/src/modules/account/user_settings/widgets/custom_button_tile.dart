import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class UserSettingsPageViewCustomButtonTile extends StatelessWidget {
  final CustomButtonTileType buttonTileType;

  const UserSettingsPageViewCustomButtonTile({
    super.key,
    required this.buttonTileType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: MyAppKColors.kdarkShadeBlue.withOpacity(0.9)),
        child: Row(
          children: [
            SvgPicture.asset(
              getButtonIconPath(),
              semanticsLabel: 'Icon',
              fit: BoxFit.scaleDown,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 15),
            Text(
              getButtonText(),
              style: MyAppKColors.userSettingsCustomButtonTile(),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: MyAppKColors.kWhiteColor,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }

  String getButtonText() {
    switch (buttonTileType) {
      case CustomButtonTileType.changePassword:
        return 'Change Password';

      case CustomButtonTileType.deleteAccount:
      default:
        return 'Delete my account';
    }
  }

  String getButtonIconPath() {
    switch (buttonTileType) {
      case CustomButtonTileType.changePassword:
        return 'assets/icons/shield_regular_icon.svg';

      case CustomButtonTileType.deleteAccount:
      default:
        return 'assets/icons/trash_regular_icon.svg';
    }
  }

  onTap() {
    switch (buttonTileType) {
      case CustomButtonTileType.changePassword:
        return changePasswordOnTap();

      case CustomButtonTileType.deleteAccount:
      default:
        return deleteAccountOnTap();
    }
  }

  changePasswordOnTap() {
    print('CHANGE PASSWORD BUTTON TAPPED');
  }

  deleteAccountOnTap() {
    print('DELETE ACCOUNT BUTTON TAPPED');
  }
}
