import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/auth_repository.dart';
import 'package:loomi_challenge/src/repositories/firebase_database_repository/firebase_database_repository.dart';

class CreateUserAccountController {
  final authRepository = AuthRepository();
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

  Future<Map<String, dynamic>> _googleSignUp() async {
    final credentials = await AuthRepository().googleSignIn();
    final userData = {
      'name': credentials.user?.displayName,
      'email': credentials.user?.email,
      'image': credentials.user?.photoURL,
      'user_id': credentials.user?.uid,
    };

    return {
      'success': credentials.user != null,
      'user_data': userData,
      'message': 'Fail on login with google account',
    };
  }

  Future<Map<String, dynamic>> _emailPassSignUp() async {
    final validatorMessage = validatorFields();

    if (validatorMessage != null) {
      return {'success': false, 'message': validatorMessage};
    }

    loadingDialog();

    final responseCreateUserAccount = await authRepository.createUserEmailPass(
        email: email!.toLowerCase(), password: password!);

    if (!responseCreateUserAccount['success']) {
      return responseCreateUserAccount;
    }

    final userData = toJson()
      ..update('user_id', (value) => responseCreateUserAccount['user_id'],
          ifAbsent: () => responseCreateUserAccount['user_id']);

    return {'success': true, 'user_data': userData};
  }

  signUpAccount(SignInMethod signInMethod) async {
    Map<String, dynamic> response = {};

    final isGoogleSignUp = signInMethod == SignInMethod.google;

    if (isGoogleSignUp) {
      response = await _googleSignUp();
    } else {
      response = await _emailPassSignUp();
    }

    if (!response['success']) {
      Get.back();
      MyAppSnackBar(
          message: response['message'], snackBarType: SnackBarType.fail)
        ..show();
      return;
    }

    if (isGoogleSignUp) loadingDialog();

    final userData = response['user_data'];

    final saveUserDataResponse =
        await firebaseDatabaseRepository.postUserData(userData);

    if (!saveUserDataResponse['success']) {
      Get.back();
      final String message = saveUserDataResponse['message'];
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    if (hasImage) {
      final responseUploadFile = await firebaseDatabaseRepository.uploadFile(
        userId: userData['user_id'],
        imagePath: profileImage.value,
      );
      final bool success = responseUploadFile['success'];
      if (success) {
        userData.update(
          'image',
          (value) => responseUploadFile['file_url'],
          ifAbsent: () => responseUploadFile['file_url'],
        );
      } else {
        MyAppSnackBar(
            message: responseUploadFile['message'],
            snackBarType: SnackBarType.fail)
          ..show();
      }
    }

    print(' -- UserData: $userData');

    Get.offAllNamed(RoutesNames.HomePageView);
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
    this.email = email;
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
