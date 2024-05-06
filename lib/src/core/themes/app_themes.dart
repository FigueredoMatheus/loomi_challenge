import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyThemes {
  static MyThemes get() {
    return LightModeTheme();
  }

  late Color kPurpleColor;
  late Color kLightPurpleColor;
  late Color kVeryDarkGrayColor;
  late Color kLightGrayColor;
  late Color kDarkShadeGrayColor;
  late Color kDarkGrayColor;
  late Color kSilverGrayColor;
  late Color kGainsboroGrayColor;
  late Color kOutlinedButtonTextColor;
  late Color kdarkShadeBlue;
  late Color kdarkShadeOliveGreen;
  late Color kOffWhiteColor;
  late Color kWhiteColor;
  late Color kFormFieldBorderColor;
  late Color kFormFieldBgColor;
  late Color kButtonShowColor;
  late Color kMovieCardBorderColor;
  late Color kUserProfileImgeBgColorJ;
  late Color kUserProfileImgeBgColorL;
  late Color kUserProfileImgeBgColorS;

  String get epilogueFamily => typography.epilogueFamily;
  String get montserratFamily => typography.montserratFamily;
  String get outfitFamily => typography.outfitFamily;

  TextStyle get epilogueStyle => typography.epilogueStyle;
  TextStyle get montserratStyle => typography.montserratStyle;
  TextStyle get outfitStyle => typography.outfitStyle;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends MyThemes {
  late Color kPurpleColor = const Color(0xFFAA73F0);
  late Color kLightPurpleColor = const Color(0xFFBC4CF1);
  late Color kVeryDarkGrayColor = const Color(0xff131418);
  late Color kLightGrayColor = const Color(0xFFD7D7D7);
  late Color kDarkShadeGrayColor = const Color(0xFF1A1A20);
  late Color kDarkGrayColor = const Color(0xFF555252);
  late Color kSilverGrayColor = const Color(0xFFBBBBBB);
  late Color kGainsboroGrayColor = const Color(0xFFD9D9D9);
  late Color kOutlinedButtonTextColor = const Color(0xFFD9DADE);
  late Color kdarkShadeBlue = const Color(0xFF33333F);
  late Color kdarkShadeOliveGreen = const Color(0xFF574F3E);
  late Color kOffWhiteColor = const Color(0xFFF4F4F4);
  late Color kWhiteColor = const Color(0xFFFFFFFF);
  late Color kFormFieldBorderColor = const Color(0xFF6C6D7A);
  late Color kFormFieldBgColor = const Color(0xFF23252C);
  late Color kButtonShowColor = const Color(0xFFF1CC4C);
  late Color kMovieCardBorderColor = const Color(0xFF929292);
  late Color kUserProfileImgeBgColorJ = const Color(0xFF32A1DC);
  late Color kUserProfileImgeBgColorL = const Color(0xFFF7931A);
  late Color kUserProfileImgeBgColorS = const Color(0xFFD9507A);
}

abstract class Typography {
  String get epilogueFamily;
  String get montserratFamily;
  String get outfitFamily;

  TextStyle get epilogueStyle;
  TextStyle get montserratStyle;
  TextStyle get outfitStyle;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final MyThemes theme;

  String get epilogueFamily => 'epilogue';
  TextStyle get epilogueStyle => TextStyle(
        fontFamily: epilogueFamily,
        fontSize: 18,
        color: theme.kWhiteColor,
        fontWeight: FontWeight.w700,
      );

  String get montserratFamily => 'montserrat';
  TextStyle get montserratStyle => TextStyle(
        fontFamily: montserratFamily,
        fontSize: 18,
        color: theme.kWhiteColor,
        fontWeight: FontWeight.w700,
      );

  String get outfitFamily => 'outfit';
  TextStyle get outfitStyle => TextStyle(
        fontFamily: outfitFamily,
        fontSize: 12,
        color: theme.kWhiteColor,
        fontWeight: FontWeight.w500,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
