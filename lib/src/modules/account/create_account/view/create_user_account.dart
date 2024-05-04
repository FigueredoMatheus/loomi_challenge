import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/create_account/controller/create_account_controller.dart';
import 'package:loomi_challenge/src/modules/account/create_account/view/pages/first_page.dart';
import 'package:loomi_challenge/src/modules/account/create_account/view/pages/second_page.dart';

class CreateUserAccountPageView extends StatefulWidget {
  const CreateUserAccountPageView({super.key});

  @override
  State<CreateUserAccountPageView> createState() =>
      _CreateUserAccountPageViewState();
}

class _CreateUserAccountPageViewState extends State<CreateUserAccountPageView> {
  late PageController pageViewController;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();

    pageViewController = PageController(initialPage: 0);

    getIt<CreateUserAccountController>().init(
      pageController: pageViewController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 30,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          child: PageView(
            controller: pageViewController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              CreateUserAccountFirstPage(
                  pageViewController: pageViewController),
              CreateUserAccountSecondPage(
                  pageViewController: pageViewController),
            ],
          ),
        ),
      ),
    );
  }
}
