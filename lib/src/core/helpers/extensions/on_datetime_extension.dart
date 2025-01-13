import 'package:intl/intl.dart';

extension onDateTimeExtensions on DateTime {
  String toCustomCommentDateFormat() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays < 7) {
      return DateFormat('yyyy-MM-dd').format(this);
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else {
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    }
  }
}
