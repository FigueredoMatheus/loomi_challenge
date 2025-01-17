import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/create_account/store/create_account_store.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_service.dart';

class CreateUserAccountController {
  final store = getIt<CreateAccountStore>();

  signUpAccount() async {
    loadingDialog();

    final data = store.getData();

    final response = await AuthService().signUpAccountService(data);

    Get.back();

    if (response.success) {
      Get.offAllNamed(RoutesNames.HOME_PAGE_VIEW);
    } else {
      exceptionWarning(response.exception!);
    }
  }
}
