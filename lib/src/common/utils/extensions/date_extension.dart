import 'package:intl/intl.dart';

extension DateTimeExtesions on DateTime {
  String monthDayYearFormt() {
    // Output: Feb 29, 2023
    String formattedDate = DateFormat('MMM d, y').format(this);
    return formattedDate;
  }
}
