import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';

class MyAppSnackBar {
  final String? message;
  final String? title;
  final int durationInSeconds;
  final SnackBarType snackBarType;

  MyAppSnackBar({
    required this.message,
    required this.snackBarType,
    this.title,
    this.durationInSeconds = 3,
  });

  show() {
    if (message == null) return;

    final snackBar = GetSnackBar(
      backgroundColor: _getSnackBarColor(),
      duration: Duration(seconds: durationInSeconds),
      title: title,
      message: message,
    );

    Get.showSnackbar(snackBar);
  }

  Color _getSnackBarColor() {
    switch (snackBarType) {
      case SnackBarType.textFieldError:
      default:
        return Colors.red;
    }
  }
}
