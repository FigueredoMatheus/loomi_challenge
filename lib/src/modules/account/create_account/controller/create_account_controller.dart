import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';

class CreateUserAccountController {
  String? email;
  String? password;
  String? confirmPassword;
  String? name;

  var profileImage = ''.obs;

  late PageController pageViewController;

  bool get hasImage => profileImage.value.isNotEmpty;

  init({required PageController pageController}) {
    this.pageViewController = pageController;
  }

  bool validatorFields() {
    String? message;

    message = TextFieldValidatorsHelper.emailValidator(email);

    message = TextFieldValidatorsHelper.passwordValidator(password);

    message = TextFieldValidatorsHelper.confirmPasswordValidator(
      confirmPassword,
      password!,
    );

    message = TextFieldValidatorsHelper.nameValidator(name);

    MyAppSnackBar(
      message: message,
      snackBarType: SnackBarType.textFieldError,
    )..show();

    return message == null;
  }

  nextPage() => pageViewController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

  previousPage() => pageViewController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

  setEmail(String email) {
    email = email;
  }

  setPassword(String text) {
    password = text;
  }

  setConfirmPassword(String text) {
    confirmPassword = text;
  }

  setName(String text) {
    name = text;
  }

  setProfileImage(String imagePth) {
    profileImage.value = imagePth;
  }

  dispose() {
    pageViewController.dispose();
  }
}
