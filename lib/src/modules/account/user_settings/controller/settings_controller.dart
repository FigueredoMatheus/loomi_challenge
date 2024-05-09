import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/core/services/auth_service.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:provider/provider.dart';

class SettingsController {
  String? name;
  var image = ''.obs;
  var currentPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmNewPassword = ''.obs;

  init(Map<String, dynamic> json) {
    setName(json['username']);
    setImage(json['image']);
  }

  onChangeUserPassword() async {
    final message = TextFieldValidatorsHelper().validateFields(
        password: newPassword.value, confirmPassword: confirmNewPassword.value);

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    final response =
        await AuthService().changeUserPasswordService(_changePasswordData());
    if (response) {
      _onSuccessChangedUserPassword();
    }
  }

  onUpdate() {
    final message =
        TextFieldValidatorsHelper().validateFields(name: name ?? '');

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    Provider.of<UserProvider>(Get.context!, listen: false).setUsername(name!);
  }

  _onSuccessChangedUserPassword() {
    setConfirmNewPassword('');
    setCurrentPassword('');
    setNewPassword('');
  }

  Map<String, dynamic> _changePasswordData() {
    return {
      "password": this.newPassword.value,
      "currentPassword": this.currentPassword.value,
      "passwordConfirmation": this.confirmNewPassword.value,
    };
  }

  setCurrentPassword(String text) {
    this.currentPassword.value = text;
  }

  setNewPassword(String text) {
    this.newPassword.value = text;
  }

  setConfirmNewPassword(String text) {
    this.confirmNewPassword.value = text;
  }

  setName(String? text) {
    name = text;
  }

  setImage(String? image) {
    this.image.value = image ?? '';
  }
}
