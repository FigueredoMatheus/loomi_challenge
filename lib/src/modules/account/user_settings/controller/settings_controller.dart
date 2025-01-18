import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/alert_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/store/profile_settings_store.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_service.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/services/user_services/user_services.dart';
import 'package:provider/provider.dart';

class ProfileSettingsController {
  final authService = AuthService();
  final userService = UserServices();
  final profileSettingsStore = getIt<ProfileSettingsStore>();

  deleteUserAccount() async {
    loadingDialog();

    final response = await userService.deleteAccount();

    if (response.success) {
      Get.offAndToNamed(RoutesNames.LOGIN_PAGE_VIEW);
      MyAppSnackBar(
              message: 'Your account has been successfully deleted',
              snackBarType: SnackBarType.success)
          .show();
    } else {
      exceptionWarning(response.exception!);
    }
  }

  changeUserPassword() async {
    loadingDialog();

    final data = {
      "password": profileSettingsStore.newPassword.value,
      "currentPassword": profileSettingsStore.currentPassword.value,
      "passwordConfirmation": profileSettingsStore.confirmNewPassword.value,
    };

    final response = await authService.changeUserPasswordService(data);

    Get.back();

    if (response.success) {
      Get.back();
      profileSettingsStore.resetData();
      alertDialog(title: 'password changed successfully');
    } else {
      exceptionWarning(response.exception!);
    }
  }

  updateUserData() async {
    loadingDialog();

    final username = profileSettingsStore.name!;
    final image = profileSettingsStore.image.value.isEmpty
        ? null
        : profileSettingsStore.image.value;

    final data = {"username": username};

    final response = await userService.updateUserData(data);

    Get.back();

    if (response.success) {
      Get.back();

      Provider.of<UserProvider>(Get.context!, listen: false)
          .updateUserData(username, image);
      alertDialog(title: 'User data has been successfully updated');
    } else {
      exceptionWarning(response.exception!);
    }
  }

  userLogout() async {
    loadingDialog();

    final response = await userService.logoutFirebaseUser();

    if (response.success) {
      Provider.of<UserProvider>(Get.context!, listen: false).logout();
      Get.offAllNamed(RoutesNames.LOGIN_PAGE_VIEW);
      MyAppSnackBar(
              message: 'The user has been logged out',
              snackBarType: SnackBarType.alert)
          .show();
    } else {
      Get.back();
    }
  }
}
