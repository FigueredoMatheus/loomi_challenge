import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppKColors {
  static const kPurpleColor = Color(0xFFAA73F0);
  static const kLightPurpleColor = Color(0xFFBC4CF1);

  static const kDarkGreyColor = Color(0xFFD7D7D7);
  static const kWhiteColor = Color(0xFFFFFFFF);
  static const kFormFieldBorderColor = Color(0xFF6C6D7A);
  static const kFormFieldBgColor = Color(0xFF23252C);
  static const kButtonShowColor = Color(0xFFF1CC4C);

  static TextStyle subtitle1() {
    return GoogleFonts.montserrat(
      color: MyAppKColors.kWhiteColor.withOpacity(0.45),
    );
  }
}
