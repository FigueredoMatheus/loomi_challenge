import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/exception_warning_dialog.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/loading_dialog.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/forgot_password/store/forgot_password_store.dart';
import 'package:loomi_challenge/src/services/auth_services/auth_service.dart';

class ForgotPasswordController {
  final authServices = AuthService();
  final store = getIt<ForgotPasswordStore>();

  sendEmailButtonOnTap() async {
    loadingDialog();

    final data = {'email': store.email};

    final response = await authServices.forgotUserPasswordService(data);

    Get.back();
    if (response.success) {
      Get.offAllNamed(RoutesNames.SUCCES_ON_SEND_RESENT_EMAIL_PAGE_VIEW);
    } else {
      exceptionWarning(response.exception!);
    }
  }
}
