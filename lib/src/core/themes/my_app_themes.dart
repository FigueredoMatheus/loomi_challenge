import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class MyAppThemes extends GetxService {
  ThemeData getLightTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.epilogueTextTheme().copyWith(
        displayLarge: TextStyle(
          fontSize: 26,
          color: MyThemes.get().kWhiteColor,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          color: MyThemes.get().kWhiteColor,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          color: MyThemes.get().kWhiteColor,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: MyThemes.get().kWhiteColor),
        bodySmall: TextStyle(
          color: MyThemes.get().kWhiteColor.withOpacity(0.40),
          fontSize: 15,
        ),
      ),
      scaffoldBackgroundColor: MyThemes.get().kVeryDarkGrayColor,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.epilogue(
            fontSize: 14.67,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.epilogue(
            fontSize: 14.67,
            fontWeight: FontWeight.w600,
          )),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return MyThemes.get().kBtnBgColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.33),
              side: BorderSide(
                color: MyThemes.get().kPurpleColor,
                width: 0.92,
              ),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xff23252C),
        focusedBorder: _getLightThemeTextFieldBorder(),
        errorBorder: _getLightThemeTextFieldBorder(),
        enabledBorder: _getLightThemeTextFieldBorder(),
        labelStyle: GoogleFonts.epilogue(
          color: MyThemes.get().kWhiteColor.withOpacity(0.40),
          fontSize: 15,
        ),
      ),
    );
  }

  OutlineInputBorder _getLightThemeTextFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
      borderSide: BorderSide(
        color: MyThemes.get().kFormFieldBorderColor,
      ),
    );
  }
}
