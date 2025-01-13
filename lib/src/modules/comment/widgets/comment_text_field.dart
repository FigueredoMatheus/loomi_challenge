import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loomi_challenge/src/common/widgets/custom_text_form_field.dart';
import 'package:loomi_challenge/src/common/widgets/images_widgets/circle_avatar_profile_image.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

class CommentTextField extends StatefulWidget {
  @override
  _CommentTextFieldState createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  bool _showSendIcon = false;

  void _onTextChanged(String text) {
    setState(() {
      _showSendIcon = text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<UserProvider>(context).user;
    return Container(
      padding: const EdgeInsets.only(top: 13),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: MyThemes.get().kGainsboroGrayColor.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatarProfileImage(
            user: loggedUser,
            containerSize: 40,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomTextFormField(
              onChanged: _onTextChanged,
              label: 'Add a reply...',
              textFormFieldType: TextFormFieldType.text,
            ),
          ),
          SizedBox(width: 8),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final slideAnimation = Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset(0.0, 0.0),
              ).animate(animation);
              return SlideTransition(
                position: slideAnimation,
                child: child,
              );
            },
            child: _showSendIcon
                ? InkWell(
                    onTap: () {
                      print('--- Send Comment');
                    },
                    child: SvgPicture.asset(
                      'assets/icons/send_comment_icon.svg',
                      semanticsLabel: 'Send Comment',
                      width: 27,
                    ),
                  )
                : SizedBox.shrink(
                    key: ValueKey('empty_space'),
                  ),
          ),
        ],
      ),
    );
  }
}
