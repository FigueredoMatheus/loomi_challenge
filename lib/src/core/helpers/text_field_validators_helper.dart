import 'package:email_validator/email_validator.dart';

class TextFieldValidatorsHelper {
  static String? emailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Email is required ';
    }
    final bool isValid = EmailValidator.validate(text);

    if (!isValid) {
      return 'Invalid Email';
    }

    return null;
  }

  static String? passwordValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Password is required';
    }

    final bool isValid = text.length >= 8;

    if (!isValid) {
      return 'Password too short';
    }

    return null;
  }

  static String? confirmPasswordValidator(String? text, String password) {
    if (text == null || text.isEmpty) {
      return 'Confirm your password for security.';
    }

    final bool isValid = text == password;

    if (!isValid) {
      return 'Passwords are not the same';
    }

    return null;
  }

  static String? nameValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Name is required';
    }

    final RegExp nameRegExp = RegExp(r"\w+\s\w+");
    final isNameValid = nameRegExp.hasMatch(text);

    if (!isNameValid) {
      return 'First and last name required';
    }

    return null;
  }
}
