import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/core/services/user_provider.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/modules/comment/store/comment_store.dart';
import 'package:provider/provider.dart';

class CommentActionsModalBody extends StatefulWidget {
  final MovieCommentEntity comment;

  const CommentActionsModalBody({super.key, required this.comment});

  @override
  State<CommentActionsModalBody> createState() =>
      _CommentActionsModalBodyState();
}

class _CommentActionsModalBodyState extends State<CommentActionsModalBody> {
  late bool isCurrentUserComment;
  late CommentStore commentStore;

  @override
  void initState() {
    super.initState();
    isCurrentUserComment = widget.comment.user.id ==
        Provider.of<UserProvider>(context, listen: false).userId;
    commentStore = getIt<CommentStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          actionBtn(CommectActionType.edit),
          actionBtn(CommectActionType.delete),
          actionBtn(CommectActionType.report),
        ],
      ),
    );
  }

  Widget actionBtn(CommectActionType actionType) {
    final isReportAction = actionType == CommectActionType.report;
    final showAction = isCurrentUserComment ? !isReportAction : isReportAction;

    return !showAction
        ? Container()
        : TextButton.icon(
            onPressed: () => btnActionOnTap(actionType),
            icon: getActionIcon(actionType),
            label: Text(
              getActionBtnText(actionType),
              style: MyThemes.get().robotoStyle.copyWith(
                    fontSize: 16,
                    color: isReportAction
                        ? MyThemes.get().kPurpleColor
                        : MyThemes.get().kWhiteColor,
                  ),
            ),
          );
  }

  Widget getActionIcon(CommectActionType actionType) {
    late String iconPath;
    switch (actionType) {
      case CommectActionType.delete:
        iconPath = 'assets/icons/trash_regular_icon.svg';
      case CommectActionType.edit:
        iconPath = 'assets/icons/edit_icon.svg';
      case CommectActionType.report:
      default:
        iconPath = 'assets/icons/report_icon.svg';
    }

    return SvgPicture.asset(
      iconPath,
      semanticsLabel: 'Action Icon',
      fit: BoxFit.scaleDown,
      width: 18,
    );
  }

  String getActionBtnText(CommectActionType actionType) {
    switch (actionType) {
      case CommectActionType.delete:
        return 'Delete';
      case CommectActionType.edit:
        return 'Edit';
      case CommectActionType.report:
      default:
        return 'Report';
    }
  }

  btnActionOnTap(CommectActionType actionType) {
    switch (actionType) {
      case CommectActionType.delete:
        commentStore.onDeleteComment(widget.comment);
        break;
      case CommectActionType.edit:
        commentStore.onEditComment(widget.comment);
        break;
      case CommectActionType.report:
      default:
        commentStore.onReportComment(widget.comment);
        break;
    }
  }

  Color getActionColor(CommectActionType actionType) {
    switch (actionType) {
      case CommectActionType.delete:
      case CommectActionType.edit:
        return MyThemes.get().kWhiteColor;
      case CommectActionType.report:
      default:
        return MyThemes.get().kPurpleColor;
    }
  }
}
