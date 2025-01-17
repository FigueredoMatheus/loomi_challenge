import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/store/profile_settings_store.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_service.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/services/user_services/user_services.dart';
import 'package:provider/provider.dart';

class ProfileSettingsController {
  final authService = AuthService();
  final userSerice = UserServices();
  final profileSettingsStore = getIt<ProfileSettingsStore>();

  onChangeUserPassword() async {
    final isValid = profileSettingsStore.onChangeUserPasswordValidation();

    if (!isValid) return;

    final data = {
      "password": profileSettingsStore.newPassword.value,
      "currentPassword": profileSettingsStore.currentPassword.value,
      "passwordConfirmation": profileSettingsStore.confirmNewPassword.value,
    };

    final response = await authService.changeUserPasswordService(data);

    if (response) {
      profileSettingsStore.resetData();
    }
  }

  updateUserData() async {
    final isValid = profileSettingsStore.onUpdateUserDataValidation();

    if (!isValid) return;

    final username = profileSettingsStore.name!;

    final data = {"username": username};

    final response = await userSerice.updateUserData(data);

    if (response) {
      Provider.of<UserProvider>(Get.context!, listen: false)
          .setUsername(username);
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
