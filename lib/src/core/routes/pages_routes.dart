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
import 'package:loomi_challenge/src/modules/account/user_settings/view/user_subscription_page_view.dart';
import 'package:loomi_challenge/src/modules/comment/view/movie_comments_page_view.dart';
import 'package:loomi_challenge/src/modules/home/view/home_page_view.dart';
import 'package:loomi_challenge/src/modules/movie_player/view/movie_player_page_view.dart';

class PagesRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: RoutesNames.LOGIN_PAGE_VIEW,
      page: () => const LoginPageView(),
    ),
    GetPage(
      name: RoutesNames.FORGOT_PASSWORD_PAGE_VIEW,
      page: () => const ForgotPasswordPageView(),
    ),
    GetPage(
      name: RoutesNames.SUCCES_ON_SEND_RESENT_EMAIL_PAGE_VIEW,
      page: () => const SucccessOnSendEmailPageView(),
    ),
    GetPage(
      name: RoutesNames.CREATE_ACCOUNT_PAGE_VIEW,
      page: () => const CreateUserAccountPageView(),
    ),
    GetPage(
      name: RoutesNames.HOME_PAGE_VIEW,
      page: () => const HomePageViewModel(),
    ),
    GetPage(
      name: RoutesNames.USER_SETTINGS_PAGE_VIEW,
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 300),
      page: () => const UserSettingsPageView(),
    ),
    GetPage(
      name: RoutesNames.CHANGE_USER_PASSWORD_PAGE_VIEW,
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 300),
      page: () => const ChangeUserPasswordPageView(),
    ),
    GetPage(
      name: RoutesNames.EDIT_PROFILE_PAGE_VIEW,
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 300),
      page: () => const EditProfilePageView(),
    ),
    GetPage(
      name: RoutesNames.USER_SUBSCRIPTION_PAGE_VIEW,
      page: () => const UserSubscriptionPageView(),
    ),
    GetPage(
      name: RoutesNames.MOVIE_PLAYER_PAGE_VIEW,
      page: () {
        final MovieEntity movie = Get.arguments;
        return MoviePlayerPageView(movie: movie);
      },
    ),
    GetPage(
      name: RoutesNames.MOVIE_COMMENTS_PAGE_VIEW,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
      page: () {
        final MovieEntity movie = Get.arguments;
        return MovieCommentsPageView(movie: movie);
      },
    ),
  ];
}
