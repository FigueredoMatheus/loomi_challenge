import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/login/store/login_store.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_service.dart';

class LoginController {
  final store = getIt<LoginStore>();

  signInUser() async {
    loadingDialog();

    final credentials = {
      'identifier': store.email,
      'password': store.password,
    };

    final response = await AuthService().signInUserService(credentials);
    Get.back();

    if (response.success) {
      Get.offAllNamed(RoutesNames.HOME_PAGE_VIEW);
    } else {
      exceptionWarning(response.exception!);
    }
  }
}
