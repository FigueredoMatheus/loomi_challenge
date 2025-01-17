import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordStore {
  final controller = ForgotPasswordController();

  String? email;

  onSendEmail() {
    final message =
        TextFieldValidatorsHelper().validateFields(email: email ?? '');

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    controller.sendEmailButtonOnTap();
  }

  setEmail(String? text) {
    this.email = text;
  }

  dispose() {
    setEmail(null);
  }
}
