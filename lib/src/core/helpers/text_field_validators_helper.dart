import 'package:email_validator/email_validator.dart';

class TextFieldValidatorsHelper {
  String? validateFields({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    bool isCreateAccount = false,
  }) {
    String? message;

    if (email != null) {
      message = _emailValidator(email);
      if (message != null) {
        return message;
      }
    }

    if (password != null) {
      message = _passwordValidator(
        password,
        isCreateAccount: isCreateAccount,
      );
      if (message != null) {
        return message;
      }
    }

    if (confirmPassword != null) {
      message = _confirmPasswordValidator(confirmPassword, password!);
      if (message != null) {
        return message;
      }
    }

    if (name != null) {
      message = _nameValidator(name);
      if (message != null) {
        return message;
      }
    }

    return null;
  }

  static String? _emailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Email is required ';
    }
    final bool isValid = EmailValidator.validate(text);

    if (!isValid) {
      return 'Invalid Email';
    }

    return null;
  }

  static String? _passwordValidator(
    String? text, {
    required bool isCreateAccount,
  }) {
    if (text == null || text.isEmpty) {
      return 'Password is required';
    }

    final bool isValid = text.length >= 8;

    if (!isValid && isCreateAccount) {
      return 'Password too short';
    }

    return null;
  }

  static String? _confirmPasswordValidator(String? text, String password) {
    if (text == null || text.isEmpty) {
      return 'Confirm your password for security.';
    }

    final bool isValid = text == password;

    if (!isValid) {
      return 'Passwords are not the same';
    }

    return null;
  }

  static String? _nameValidator(String? text) {
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
