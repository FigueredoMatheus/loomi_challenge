import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/routes/routes_names.dart';
import 'package:loomi_challenge/src/modules/account/create_account/view/create_user_account.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/view/forgot_password_page_view.dart';
import 'package:loomi_challenge/src/modules/account/forgot_password/view/success_on_send_email_page_view.dart';
import 'package:loomi_challenge/src/modules/account/login/view/login_page_view.dart';
import 'package:loomi_challenge/src/modules/home/view/home_page_view.dart';

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
      name: RoutesNames.HomePageView,
      page: () => const HomePageViewModel(),
    ),
  ];
}
