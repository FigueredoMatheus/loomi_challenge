import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class SocialMedialLoginButtonWidget extends StatefulWidget {
  final SocialMediaType socialMediaType;

  const SocialMedialLoginButtonWidget({
    super.key,
    required this.socialMediaType,
  });

  @override
  State<SocialMedialLoginButtonWidget> createState() =>
      _SocialMedialLoginButtonWidgetState();
}

class _SocialMedialLoginButtonWidgetState
    extends State<SocialMedialLoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getOnTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: bgColor(),
          borderRadius: BorderRadius.circular(30),
        ),
        child: socialMediaIcon(),
      ),
    );
  }

  Color bgColor() {
    switch (widget.socialMediaType) {
      case SocialMediaType.google:
        return MyAppKColors.kLightPurpleColor.withOpacity(0.2);
      case SocialMediaType.apple:
      default:
        return MyAppKColors.kWhiteColor.withOpacity(0.33);
    }
  }

  Widget socialMediaIcon() {
    switch (widget.socialMediaType) {
      case SocialMediaType.google:
        return SvgPicture.asset(
          'assets/icons/google_icon.svg',
          semanticsLabel: 'Google',
          fit: BoxFit.scaleDown,
          height: 30,
          width: 30,
        );
      case SocialMediaType.apple:
      default:
        return SvgPicture.asset(
          'assets/icons/Vector.svg',
          semanticsLabel: 'Google',
          fit: BoxFit.scaleDown,
          height: 30,
          width: 30,
        );
    }
  }

  getOnTap() {
    switch (widget.socialMediaType) {
      case SocialMediaType.google:
        return googleOnTap();
      case SocialMediaType.apple:
      default:
        return appleOnTap();
    }
  }

  appleOnTap() {
    print('--- APPLE ON TAP');
  }

  googleOnTap() {
    print('--- GOOGLE ON TAP');
  }
}
