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

  Future<Map<String, dynamic>> _createUserAccount() async {
    final responseCreateUserAccount = await authRepository.createUserEmailPass(
        email: email!.toLowerCase(), password: password!);

    if (!responseCreateUserAccount['success']) {
      return responseCreateUserAccount;
    }

    final data = toJson()
      ..update('user_id', (value) => responseCreateUserAccount['user_id'],
          ifAbsent: () => responseCreateUserAccount['user_id']);

    final saveUserDataResponse =
        await firebaseDatabaseRepository.postUserData(data);

    if (!saveUserDataResponse['success']) {
      return saveUserDataResponse;
    }

    if (hasImage) {
      final responseUploadFile = await firebaseDatabaseRepository.uploadFile(
        userId: data['user_id'],
        imagePath: profileImage.value,
      );
      final bool success = responseUploadFile['success'];
      if (success) {
        data.update(
          'image',
          (value) => responseUploadFile['file_url'],
          ifAbsent: () => responseUploadFile['file_url'],
        );
      }
    }

    return {
      'success': true,
      'message': 'User created successfully',
      'user_data': data,
    };
  }

  continueButtonOnTap() async {
    final validatorMessage = validatorFields();

    MyAppSnackBar(
      message: validatorMessage,
      snackBarType: SnackBarType.fail,
    )..show();

    if (validatorMessage != null) return;

    loadingDialog();

    final createUserAccountResponse = await _createUserAccount();

    final userData = createUserAccountResponse['user_data'];
    print('--- Create User Data: $userData');

    Get.back();

    final bool success = createUserAccountResponse['success'];
    final String message = createUserAccountResponse['message'];

    MyAppSnackBar(
      message: message,
      snackBarType: success ? SnackBarType.success : SnackBarType.fail,
    )..show();

    if (success) {
      Get.offAllNamed(RoutesNames.HomePageView);
    }
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
