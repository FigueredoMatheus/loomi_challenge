import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  String? validatorFields() {
    String? message;

    message = TextFieldValidatorsHelper.emailValidator(email);

    if (message != null) {
      return message;
    }

    message = TextFieldValidatorsHelper.passwordValidator(password);

    if (message != null) {
      return message;
    }

    message = TextFieldValidatorsHelper.confirmPasswordValidator(
      confirmPassword,
      password!,
    );

    if (message != null) {
      return message;
    }

    message = TextFieldValidatorsHelper.nameValidator(name);

    if (message != null) {
      return message;
    }

    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'name': this.name,
      'password': this.password,
    };
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
    this.email = email;
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
