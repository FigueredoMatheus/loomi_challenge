import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/confirmation_dialog.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/helpers/text_field_validators_helper.dart';
import 'package:loomi_challenge/src/modules/user_settings/controller/settings_controller.dart';

class ProfileSettingsStore {
  String? name;
  var image = ''.obs;
  var currentPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmNewPassword = ''.obs;

  onLogout() async {
    final result =
        await confirmationAlertDialog(title: 'Would you like to log out?');

    if (result == null || result == 0) return;

    final controller = ProfileSettingsController();

    controller.userLogout();
  }

  onChangeUserPassword() {
    final message = TextFieldValidatorsHelper().validateFields(
      password: newPassword.value,
      confirmPassword: confirmNewPassword.value,
    );

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    final controller = ProfileSettingsController();

    controller.changeUserPassword();
  }

  onUpdateUserData() {
    final message =
        TextFieldValidatorsHelper().validateFields(name: name ?? '');

    if (message != null) {
      MyAppSnackBar(message: message, snackBarType: SnackBarType.fail)..show();
      return;
    }

    final controller = ProfileSettingsController();

    controller.updateUserData();
  }

  onDeleteAccount() async {
    Get.back();

    final result = await confirmationAlertDialog(
      title: 'Do you want to delete your account?',
    );

    if (result == null || result == 0) return;

    final controller = ProfileSettingsController();

    controller.deleteUserAccount();
  }

  init(Map<String, dynamic> json) {
    setName(json['username']);
    setImage(json['image']);
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

  resetData() {
    setImage('');
    setName('');
    setConfirmNewPassword('');
    setCurrentPassword('');
    setNewPassword('');
  }
}
