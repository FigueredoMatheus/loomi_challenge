import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/common/widgets/social_media_login_buttons/social_media_button.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';

class SocialMediaIconsRowWidget extends StatelessWidget {
  final bool google;
  final bool apple;

  const SocialMediaIconsRowWidget({
    super.key,
    this.google = true,
    this.apple = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (google)
            SocialMedialLoginButtonWidget(
                socialMediaType: SocialMediaType.google),
          if (apple)
            SocialMedialLoginButtonWidget(
                socialMediaType: SocialMediaType.apple),
        ],
      ),
    );
  }
}
