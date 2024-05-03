import 'package:get_it/get_it.dart';
import 'package:loomi_challenge/src/modules/account/create_account/controller/create_account_controller.dart';

GetIt getIt = GetIt.instance;

void setupGetItClasses() {
  getIt.registerLazySingleton(() => CreateUserAccountController());
}
