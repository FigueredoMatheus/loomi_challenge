import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/modules/login/store/login_store.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginController {
  final authService = AuthService();
  final store = getIt<LoginStore>();

  googleSignIn() async {
    final response = await authService.googleSignInService();

    if (response == null) ;

    if (response!.success) {
      final userCredentials = response.firebaseUserCredential!;

      final userData = {
        'username': userCredentials.user?.displayName,
        'provider': 'google',
        'email': userCredentials.user?.email,
        'confirmed': true,
        'blocked': false,
      };

      Provider.of<UserProvider>(Get.context!)
          .initUser(userData, '', userCredentials);

      Get.offAllNamed(RoutesNames.HOME_PAGE_VIEW);
    } else {
      exceptionWarning(response.exception!);
    }
  }

  signInUser() async {
    loadingDialog();

    final credentials = {
      'identifier': store.email,
      'password': store.password,
    };

    final response = await authService.signInUserService(credentials);
    Get.back();

    if (response.success) {
      Get.offAllNamed(RoutesNames.HOME_PAGE_VIEW);
    } else {
      exceptionWarning(response.exception!);
    }
  }
}
