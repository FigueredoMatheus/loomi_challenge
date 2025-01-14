import 'package:loomi_challenge/src/core/data/my_app_enums.dart';

class SerializationHelper {
  static String commentStatusToJson(CommentStatus status) => status.name;

  static CommentStatus commentStatusFromJson(String status) =>
      CommentStatus.values.firstWhere(
        (e) => e.name == status,
        orElse: () => CommentStatus.Failure,
      );
}
