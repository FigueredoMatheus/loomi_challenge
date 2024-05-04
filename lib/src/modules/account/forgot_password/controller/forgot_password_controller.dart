import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/auth_repository.dart';

class ForgotPasswordController {
  final authRepository = AuthRepository();
  String? email;

  Future<Map<String, dynamic>> _SendPasswordResetEmail() {
    final sendEmailResponse =
        authRepository.sendPasswordResetEmail(email: email!);

    return sendEmailResponse;
  }

  sendEmailButtonOnTap() async {
    final validatorMessage = validatorFields();

    MyAppSnackBar(
      message: validatorMessage,
      snackBarType: SnackBarType.fail,
    )..show();

    if (validatorMessage != null) return;

    loadingDialog();

    final sendEmailResponse = await _SendPasswordResetEmail();

    Get.back();

    final bool success = sendEmailResponse['success'];
    final String message = sendEmailResponse['message'];

    MyAppSnackBar(
      message: message,
      snackBarType: success ? SnackBarType.success : SnackBarType.fail,
    )..show();
  }

  setEmail(String? text) {
    this.email = text;
  }

  String? validatorFields() {
    String? message;

    message = TextFieldValidatorsHelper.emailValidator(email);

    if (message != null) {
      return message;
    }

    return null;
  }

  dispose() {
    setEmail(null);
  }
}
