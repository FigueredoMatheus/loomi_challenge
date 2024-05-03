import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/my_app_k_colors.dart';

class CreateUserAccountFirstPageFormHeadWidget extends StatelessWidget {
  const CreateUserAccountFirstPageFormHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        divider(),
        const SizedBox(width: 20),
        Text(
          'Or Sign up With',
          style: MyAppKColors.subtitle2(),
        ),
        const SizedBox(width: 20),
        divider()
      ],
    );
  }

  Widget divider() {
    return Expanded(
        child: Divider(
      color: MyAppKColors.kOffWhiteColor.withOpacity(0.2),
    ));
  }
}
