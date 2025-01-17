import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_instances.dart';
import 'package:loomi_challenge/src/modules/account/create_account/store/create_account_store.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/store/forgot_password_store.dart';
import 'package:loomi_challenge/src/modules/account/login/store/login_store.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/store/profile_settings_store.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:loomi_challenge/src/modules/movie_player/store/movie_player_store.dart';
import 'package:loomi_challenge/src/repositories/auth_repository/auth_repository.dart';
import 'package:loomi_challenge/src/repositories/movie_repository/movie_repository.dart';
import 'package:loomi_challenge/src/repositories/user_repository/user_repository.dart';

GetIt getIt = GetIt.instance;

void setupGetItClasses() {
  getIt.registerLazySingleton(() => FirebaseManager());

  getIt.registerLazySingleton(() => ProfileSettingsStore());
  getIt.registerLazySingleton(() => MoviePlayerStore());
  getIt.registerLazySingleton(() => CommentStore());
  getIt.registerLazySingleton(() => CreateAccountStore());
  getIt.registerLazySingleton(() => ForgotPasswordStore());
  getIt.registerLazySingleton(() => LoginStore());

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

  getIt.registerLazySingleton(() => UserRepository(Dio(BaseOptions(
        contentType: 'application/json',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ))));
}
