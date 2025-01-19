import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/modules/create_account/controller/create_account_controller.dart';

class CreateAccountStore {
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

  onCreateAccount() {
    final message = TextFieldValidatorsHelper().validateFields(
      email: email ?? '',
      password: password ?? '',
      confirmPassword: confirmPassword ?? '',
      name: name ?? '',
      isCreateAccount: true,
    );

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    final controller = CreateUserAccountController();

    controller.signUpAccount();
  }

  nextPage() {
    FocusScope.of(Get.context!).unfocus();
    pageViewController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  previousPage() => pageViewController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

  setEmail(String? email) {
    this.email = email != null ? email.trim().toLowerCase() : email;
  }

  setPassword(String? text) {
    password = text;
  }

  setConfirmPassword(String? text) {
    confirmPassword = text;
  }

  setName(String? text) {
    name = text;
  }

  setProfileImage(String imagePth) {
    profileImage.value = imagePth;
  }

  Map<String, dynamic> getData() {
    return {
      'email': this.email,
      'username': this.name,
      'password': this.password,
      if (profileImage.value.isNotEmpty) 'image': profileImage.value,
    };
  }

  dispose() {
    pageViewController.dispose();
    setName(null);
    setConfirmPassword(null);
    setPassword(null);
    setEmail(null);
    setProfileImage('');
  }
}
