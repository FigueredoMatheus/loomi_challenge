import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/widgets/user_settings/button_tile/custom_button_tile.dart';

class GrupedCustomButtonTile extends StatelessWidget {
  const GrupedCustomButtonTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          UserSettingsPageViewCustomButtonTile(
            buttonTileType: CustomButtonTileType.changePassword,
          ),
          UserSettingsPageViewCustomButtonTile(
            buttonTileType: CustomButtonTileType.deleteAccount,
          ),
        ],
      ),
    );
  }
}
