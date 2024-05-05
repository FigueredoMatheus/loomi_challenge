import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppKColors {
  static const kPurpleColor = Color(0xFFAA73F0);
  static const kLightPurpleColor = Color(0xFFBC4CF1);

  static const kVeryDarkGrayColor = Color(0xff131418);
  static const kLightGrayColor = Color(0xFFD7D7D7);
  static const kDarkGrayColor = Color(0xFF555252);
  static const kSilverGrayColor = Color(0xFFBBBBBB);
  static const kGainsboroGrayColor = Color(0xFFD9D9D9);

  static const kOffWhiteColor = Color(0xFFF4F4F4);
  static const kWhiteColor = Color(0xFFFFFFFF);

  static const kFormFieldBorderColor = Color(0xFF6C6D7A);
  static const kFormFieldBgColor = Color(0xFF23252C);
  static const kButtonShowColor = Color(0xFFF1CC4C);

  static const kMovieCardBorderColor = Color(0xFF929292);

  static const kUserProfileImgeBgColorJ = Color(0xFF32A1DC);
  static const kUserProfileImgeBgColorL = Color(0xFFF7931A);
  static const kUserProfileImgeBgColorS = Color(0xFFD9507A);

  static TextStyle title1() {
    return GoogleFonts.epilogue(
      fontSize: 18,
      color: MyAppKColors.kWhiteColor,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle title2() {
    return GoogleFonts.epilogue(
      fontSize: 14,
      color: MyAppKColors.kWhiteColor,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle title3() {
    return GoogleFonts.epilogue(
      fontSize: 12,
      color: MyAppKColors.kWhiteColor,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle subtitle1() {
    return GoogleFonts.montserrat(
      color: MyAppKColors.kWhiteColor.withOpacity(0.45),
      fontSize: 14,
    );
  }

  static TextStyle subtitle2() {
    return GoogleFonts.outfit(
      color: MyAppKColors.kDarkGrayColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle subtitle3() {
    return GoogleFonts.outfit(
      color: MyAppKColors.kWhiteColor,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle movieCardGenre() {
    return GoogleFonts.epilogue(
      color: MyAppKColors.kWhiteColor,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle movieCardTitle() {
    return GoogleFonts.epilogue(
      color: MyAppKColors.kWhiteColor,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle movieCardSinopse() {
    return GoogleFonts.epilogue(
      fontSize: 14,
      color: MyAppKColors.kWhiteColor,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle movieCardMostRecentComment() {
    return GoogleFonts.epilogue(
      fontSize: 12,
      color: MyAppKColors.kWhiteColor,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle movieCardNumberOfComments() {
    return GoogleFonts.epilogue(
      fontSize: 12,
      color: MyAppKColors.kWhiteColor,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle movieCardBottomButton() {
    return GoogleFonts.epilogue(
      fontSize: 10,
      color: MyAppKColors.kWhiteColor.withOpacity(0.45),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle movieCardBottomExpiresDateLabel() {
    return GoogleFonts.epilogue(
      fontSize: 12,
      color: MyAppKColors.kWhiteColor.withOpacity(0.45),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle movieCardBottomExpiresDate() {
    return GoogleFonts.epilogue(
      fontSize: 14,
      color: MyAppKColors.kPurpleColor,
      fontWeight: FontWeight.w600,
    );
  }
}
