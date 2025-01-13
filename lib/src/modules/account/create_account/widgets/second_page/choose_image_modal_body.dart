import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/image_helper.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/modules/account/create_account/controller/create_account_controller.dart';

class ChooseUserProfileImageModalBody extends StatefulWidget {
  const ChooseUserProfileImageModalBody({super.key});

  @override
  State<ChooseUserProfileImageModalBody> createState() =>
      _ChooseUserProfileImageModalBodyState();
}

class _ChooseUserProfileImageModalBodyState
    extends State<ChooseUserProfileImageModalBody> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final containerSize = constraints.maxWidth * 0.45;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          containerImageSource(
            containerSize: containerSize,
            imageSourceType: ImageSourceType.camera,
          ),
          containerImageSource(
            containerSize: containerSize,
            imageSourceType: ImageSourceType.gallery,
          ),
        ],
      );
    });
  }

  Widget containerImageSource({
    required double containerSize,
    required ImageSourceType imageSourceType,
  }) {
    return InkWell(
      onTap: () {
        getOnTap(imageSourceType);
      },
      child: Container(
        constraints: BoxConstraints(maxHeight: 135, maxWidth: 135),
        height: containerSize,
        width: containerSize,
        decoration: BoxDecoration(
          color: containerBgColor(imageSourceType),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: containerBorderColor(imageSourceType),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            containerIcon(imageSourceType),
            const SizedBox(height: 5),
            containerText(imageSourceType),
          ],
        ),
      ),
    );
  }

  Widget containerText(ImageSourceType imageSourceType) {
    late String text;
    switch (imageSourceType) {
      case ImageSourceType.camera:
        text = 'Take a\nphoto';
      case ImageSourceType.gallery:
      default:
        text = 'Choose from gallery';
    }

    return Text(
      text,
      textAlign: TextAlign.center,
      style: MyThemes.get().montserratStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: MyThemes.get().kWhiteColor.withOpacity(0.45),
          ),
    );
  }

  Widget containerIcon(ImageSourceType imageSourceType) {
    switch (imageSourceType) {
      case ImageSourceType.camera:
        return SvgPicture.asset(
          'assets/icons/camera_icon.svg',
          semanticsLabel: 'Google',
          fit: BoxFit.scaleDown,
          height: 30,
          width: 30,
        );
      case ImageSourceType.gallery:
      default:
        return Icon(
          Icons.photo_library_outlined,
          color: Color(0xFFDEDEDE),
        );
    }
  }

  Color containerBgColor(ImageSourceType imageSourceType) {
    switch (imageSourceType) {
      case ImageSourceType.camera:
        return MyThemes.get().kLightPurpleColor.withOpacity(0.2);
      case ImageSourceType.gallery:
      default:
        return MyThemes.get().kSilverGrayColor.withOpacity(0.1);
    }
  }

  Color containerBorderColor(ImageSourceType imageSourceType) {
    switch (imageSourceType) {
      case ImageSourceType.camera:
        return MyThemes.get().kPurpleColor;
      case ImageSourceType.gallery:
      default:
        return MyThemes.get().kLightGrayColor.withOpacity(0.6);
    }
  }

  getOnTap(ImageSourceType imageSourceType) async {
    final controller = getIt<CreateUserAccountController>();
    final selectedImagePath =
        await ImageHelper().getDeviceImage(imageSourceType);

    if (selectedImagePath == null) return;

    controller.setProfileImage(selectedImagePath);
  }
}
