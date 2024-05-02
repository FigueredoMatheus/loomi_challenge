import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class MyAppThemes extends GetxService {
  ThemeData getLightTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.epilogueTextTheme().copyWith(
        displayLarge: TextStyle(
          fontSize: 26,
          color: MyAppKColors.kWhiteColor,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          color: MyAppKColors.kWhiteColor,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          color: MyAppKColors.kWhiteColor,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: MyAppKColors.kWhiteColor),
        bodySmall: TextStyle(
          color: MyAppKColors.kWhiteColor.withOpacity(0.40),
          fontSize: 15,
        ),
      ),
      scaffoldBackgroundColor: Color(0xff131418),
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
            return MyAppKColors.kLightPurpleColor.withOpacity(0.2);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.33),
                  side: BorderSide(
                    color: MyAppKColors.kPurpleColor,
                    width: 0.92,
                  ))),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xff23252C),
        focusedBorder: _getLightThemeTextFieldBorder(),
        errorBorder: _getLightThemeTextFieldBorder(),
        enabledBorder: _getLightThemeTextFieldBorder(),
        labelStyle: GoogleFonts.epilogue(
          color: MyAppKColors.kWhiteColor.withOpacity(0.40),
          fontSize: 15,
        ),
      ),
    );
  }

  OutlineInputBorder _getLightThemeTextFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
      borderSide: BorderSide(
        color: MyAppKColors.kFormFieldBorderColor,
      ),
    );
  }
}
