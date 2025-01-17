import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/alert_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
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

    final data = {"username": username};

    final response = await userService.updateUserData(data);

    Get.back();

    if (response.success) {
      Get.back();
      Provider.of<UserProvider>(Get.context!, listen: false)
          .setUsername(username);
      alertDialog(title: 'User data has been successfully updated');
    } else {
      exceptionWarning(response.exception!);
    }
  }

  logout() async {
    final result = await profileSettingsStore.onLogout();

    if (result) {
      Provider.of<UserProvider>(Get.context!, listen: false).logout();
      Get.offAllNamed(RoutesNames.LOGIN_PAGE_VIEW);
    }
  }
}
