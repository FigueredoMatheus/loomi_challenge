import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/auth_repository.dart';
import 'package:loomi_challenge/src/repositories/firebase_database_repository/firebase_database_repository.dart';

class LoginController {
  final authRepository = AuthRepository();
  final firebaseDatabaseRepository = FirebaseDatabaseRepository();

  String? email;
  String? password;

  Future<Map<String, dynamic>> _loginUser() async {
    final responseLoginUser = await authRepository.loginUserEmailPass(
        email: email!, password: password!);
    if (!responseLoginUser['success']) {
      return responseLoginUser;
    }

    final userId = responseLoginUser['user_id'];

    final getUserDataResponse =
        await firebaseDatabaseRepository.GetUserData(userId);
    if (!getUserDataResponse['success']) {
      return getUserDataResponse;
    }

    return {'success': true, 'message': 'User logged in successfully'};
  }

  onLoginButtonTapped() async {
    // final validatorMessage = validatorFields();
    // MyAppSnackBar(
    //   message: validatorMessage,
    //   snackBarType: SnackBarType.fail,
    // )..show();

    // if (validatorMessage != null) return;

    loadingDialog();

    final loginUserResponse = await _loginUser();

    Get.back();

    final bool success = loginUserResponse['success'];
    final String message = loginUserResponse['message'];

    MyAppSnackBar(
      message: message,
      snackBarType: success ? SnackBarType.success : SnackBarType.fail,
    )..show();
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

    return null;
  }

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String text) {
    password = text;
  }

  dispose() {
    email = null;
    password = null;
  }
}
