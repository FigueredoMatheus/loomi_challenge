import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_service.dart';
import 'package:loomi_challenge/src/repositories/firebase_database_repository/firebase_database_repository.dart';

class CreateUserAccountController {
  final firebaseDatabaseRepository = FirebaseDatabaseRepository();

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

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'username': this.name,
      'password': this.password,
      'image': profileImage.value,
    };
  }

  signUpAccount(SignInMethod signInMethod) async {
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

    AuthService().signUpAccountService(toJson());
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

  dispose() {
    pageViewController.dispose();
    setName(null);
    setConfirmPassword(null);
    setPassword(null);
    setEmail(null);
    setProfileImage('');
  }
}
