import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/modules/account/create_account/view/pages/first_page.dart';
import 'package:loomi_challenge/src/modules/account/create_account/view/pages/second_page.dart';

class CreateUserAccountModule extends StatefulWidget {
  const CreateUserAccountModule({super.key});

  @override
  State<CreateUserAccountModule> createState() =>
      _CreateUserAccountModuleState();
}

class _CreateUserAccountModuleState extends State<CreateUserAccountModule> {
  late PageController pageViewController;
  @override
  void initState() {
    super.initState();
    pageViewController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CreateUserAccountFirstPage(pageViewController: pageViewController),
            CreateUserAccountSecondPage(pageViewController: pageViewController),
          ],
        ),
      ),
    );
  }
}
