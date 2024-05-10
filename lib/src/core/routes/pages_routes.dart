import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/modules/account/create_account/view/create_user_account.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/view/forgot_password_page_view.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/view/success_on_send_email_page_view.dart';
import 'package:loomi_challenge/src/modules/account/login/view/login_page_view.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/view/change_password_page_view.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/view/edit_profile_page_view.dart';
import 'package:loomi_challenge/src/modules/account/user_settings/view/user_settings_page_view.dart';
import 'package:loomi_challenge/src/modules/home/view/home_page_view.dart';
import 'package:loomi_challenge/src/modules/movie_player/view/movie_player_page_view.dart';

class PagesRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: RoutesNames.loginPageView,
      page: () => const LoginPageView(),
    ),
    GetPage(
      name: RoutesNames.forgotPasswordPageView,
      page: () => const ForgotPasswordPageView(),
    ),
    GetPage(
      name: RoutesNames.successOnSendResentEmailPageView,
      page: () => const SucccessOnSendEmailPageView(),
    ),
    GetPage(
      name: RoutesNames.createAccountPageView,
      page: () => const CreateUserAccountPageView(),
    ),
    GetPage(
      name: RoutesNames.homePageView,
      page: () => const HomePageViewModel(),
    ),
    GetPage(
      name: RoutesNames.userSettingsPageView,
      page: () => const UserSettingsPageView(),
    ),
    GetPage(
      name: RoutesNames.changeUserPasswordPageView,
      page: () => const ChangeUserPasswordPageView(),
    ),
    GetPage(
      name: RoutesNames.editProfilePageView,
      page: () => const EditProfilePageView(),
    ),
    GetPage(
      name: RoutesNames.moviePlayerPageView,
      page: () {
        final MovieEntity movie = Get.arguments;
        return MoviePlayerPageView(movie: movie);
      },
    ),
  ];
}
