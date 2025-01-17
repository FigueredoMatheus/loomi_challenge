import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/modules/account/create_account/store/create_account_store.dart';
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

    getIt<CreateAccountStore>().init(
      pageController: pageViewController,
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = ApplicationConstants.PAGE_VIEW_DEFAULT_PADDING;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + padding,
            bottom: padding,
            left: padding,
            right: padding,
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

  @override
  void dispose() {
    super.dispose();
    getIt<CreateAccountStore>().dispose();
  }
}
