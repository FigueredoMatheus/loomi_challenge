import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_service.dart';

class ForgotPasswordController {
  String? email;

  sendEmailButtonOnTap() async {
    final message =
        TextFieldValidatorsHelper().validateFields(email: email ?? '');

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    final data = {'email': email};

    AuthService().forgotUserPasswordService(data);
  }

  setEmail(String? text) {
    this.email = text;
  }

  dispose() {
    setEmail(null);
  }
}
