import 'package:intl/intl.dart';

extension DateTimeExtesions on DateTime {
  String monthDayYearFormt() {
    // Output: Feb 29, 2023
    String formattedDate = DateFormat('MMM d, y').format(this);
    return formattedDate;
  }

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
