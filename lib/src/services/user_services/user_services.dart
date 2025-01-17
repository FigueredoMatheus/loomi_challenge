import 'package:loomi_challenge/src/services/user_services/user_services_impl.dart';

class UserServices extends UserServicesImplement {
  Future<bool> updateUserData(Map<String, dynamic> data) async {
    return false;
    // loadingDialog();

    // try {
    //   final userId =
    //       Provider.of<UserProvider>(Get.context!, listen: false).user.id!;

    //   await _repository.updateUserData(userId, _authToken(), data);

    //   Get.back();

    //   alertDialog(title: 'User data has been successfully updated');

    //   return true;
    // } on DioException catch (exception) {
    //   Get.back();

    //   final exceptionModel = DioExceptionHelper().getException(exception);

    //   exceptionWarning(exceptionModel);

    //   return false;
    // }
  }
}
