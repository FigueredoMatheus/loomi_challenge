import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_service.dart';
import 'package:loomi_challenge/src/repositories/firebase_database_repository/firebase_database_repository.dart';

class LoginController {
  final firebaseDatabaseRepository = FirebaseDatabaseRepository();

  String? email;
  String? password;

  signInUser() async {
    final message = TextFieldValidatorsHelper().validateFields(
      email: email ?? '',
      password: password ?? '',
    );

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    final credentials = {
      'identifier': this.email,
      'password': this.password,
    };

    AuthService().signInUserService(credentials);
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
