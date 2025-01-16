import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_instances.dart';
import 'package:loomi_challenge/src/modules/account/create_account/controller/create_account_controller.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/controller/forgot_password_controller.dart';
import 'package:loomi_challenge/src/modules/account/login/controller/login_controller.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/store/profile_settings_store.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/auth_repository.dart';
import 'package:loomi_challenge/src/repositories/movie_repository/movie_repository.dart';

GetIt getIt = GetIt.instance;

void setupGetItClasses() {
  getIt.registerLazySingleton(() => CreateUserAccountController());
  getIt.registerLazySingleton(() => LoginController());
  getIt.registerLazySingleton(() => ForgotPasswordController());
  getIt.registerLazySingleton(() => MoviePlayerStore());
  getIt.registerLazySingleton(() => CommentStore());
  getIt.registerLazySingleton(() => ProfileSettingsStore());
  getIt.registerLazySingleton(() => FirebaseManager());

  getIt.registerLazySingleton(() => AuthRepository(Dio(BaseOptions(
        contentType: 'application/json',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ))));
  getIt.registerLazySingleton(() => MovieRepository(Dio(BaseOptions(
        contentType: 'application/json',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ))));
}
