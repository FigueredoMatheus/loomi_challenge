import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/modules/account/login/controller/login_controller.dart';

class LoginStore {
  final controller = LoginController();

  String? email;
  String? password;

  onLogin() {
    final message = TextFieldValidatorsHelper().validateFields(
      email: email ?? '',
      password: password ?? '',
    );

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    controller.signInUser();
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
